from __future__ import print_function

import sys

from pyspark import SparkContext
from pyspark.streaming import StreamingContext

def updateFunction(newValues, runningCount):
    if runningCount is None:
       runningCount = 0
    return sum(newValues, runningCount)  # add the new values with the previous running count to get the new count

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: twitter-word-count.py <hostname> <port>", file=sys.stderr)
        exit(-1)
    sc = SparkContext(appName="PythonStreamingNetworkWordCount")
    ssc = StreamingContext(sc, 1)
    lines = ssc.socketTextStream(sys.argv[1], int(sys.argv[2]))
    lines = lines.map(lambda line: line.encode('utf8', 'replace'))
    words = lines.flatMap(lambda line: line.split(" "))
    pairs = words.map(lambda word: (word, 1))
    wordCounts = pairs.reduceByKey(lambda x, y: x + y)

    ssc.checkpoint(".")
    runningCounts = pairs.updateStateByKey(updateFunction)
    runningCounts.pprint()
    runningCounts.foreachRDD(lambda rdd: print(rdd.takeOrdered(20, key = lambda (k,v): -v)))

    ssc.start()
    ssc.awaitTermination()
