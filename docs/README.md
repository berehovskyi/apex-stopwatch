# Classes
## Utils

### [CpuTimeStopwatch](/docs/Utils/CpuTimeStopwatch.md)

A Stopwatch implementation based on the Limits.getCpuTime() timestamps.

### [CurrentTimeStopwatch](/docs/Utils/CurrentTimeStopwatch.md)

A Stopwatch implementation based on the System.currentTimeMillis() timestamps.

### [Stopwatch](/docs/Utils/Stopwatch.md)

A lightweight class that is designed to measure the duration of a single interval or the cumulative duration over multiple intervals. <ul>     <li>The Stopwatch.start() method is typically initiated, followed by the Stopwatch.stop() method, and the elapsed time can be reviewed using the Stopwatch.elapsed property.</li>     <li>A Stopwatch instance can either be in a running or a stopped state. The current state can be verified using the Stopwatch.isRunning property.</li>     <li>The Stopwatch.start() method is used to begin the time measurement process, while the Stopwatch.stop() method is employed to halt it.</li>     <li>The elapsed time can be obtained through the Stopwatch.elapsed property. This property can be accessed regardless of whether the Stopwatch is running or stopped. The values of the property continue to increase when the Stopwatch is operational and remain constant when it&apos;s stopped.</li>     <li>The Stopwatch.elapsed value of a Stopwatch instance, by default, equals the sum of all the measured time intervals.</li>     <li>Each call to Stopwatch.start() is initiated from the point of cumulative elapsed time, while each call to Stopwatch.stop() concludes the current interval measurement and solidifies the cumulative elapsed time value.</li>     <li>The cumulative elapsed time in an existing Stopwatch instance can be cleared using the Stopwatch.reset() method.</li>     <li>The Stopwatch.restart() is the convenience method for replacing Stopwatch.reset() and Stopwatch.start() with a single call.</li> </ul>
