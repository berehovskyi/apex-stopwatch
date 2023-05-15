# Stopwatch

`APIVERSION: 57`

`STATUS: ACTIVE`

A lightweight class that is designed to measure the duration of a single interval or the cumulative duration over multiple intervals. <ul>     <li>The Stopwatch.start() method is typically initiated, followed by the Stopwatch.stop() method, and the elapsed time can be reviewed using the Stopwatch.elapsed property.</li>     <li>A Stopwatch instance can either be in a running or a stopped state. The current state can be verified using the Stopwatch.isRunning property.</li>     <li>The Stopwatch.start() method is used to begin the time measurement process, while the Stopwatch.stop() method is employed to halt it.</li>     <li>The elapsed time can be obtained through the Stopwatch.elapsed property. This property can be accessed regardless of whether the Stopwatch is running or stopped. The values of the property continue to increase when the Stopwatch is operational and remain constant when it&apos;s stopped.</li>     <li>The Stopwatch.elapsed value of a Stopwatch instance, by default, equals the sum of all the measured time intervals.</li>     <li>Each call to Stopwatch.start() is initiated from the point of cumulative elapsed time, while each call to Stopwatch.stop() concludes the current interval measurement and solidifies the cumulative elapsed time value.</li>     <li>The cumulative elapsed time in an existing Stopwatch instance can be cleared using the Stopwatch.reset() method.</li>     <li>The Stopwatch.restart() is the convenience method for replacing Stopwatch.reset() and Stopwatch.start() with a single call.</li> </ul>


**Author** Oleh Berehovskyi


**Group** Utils

## Properties
### Properties

* `elapsed` → `Long`  - Returns the total elapsed time measured by the current instance, in milliseconds.
* `isRunning` → `Boolean`  - Returns a value indicating whether the Stopwatch timer is running.
---
## Methods
### Static Methods
##### `static getElapsedTime(Long startTimestamp, Long endTimestamp)`

Returns the elapsed time between two timestamps.

###### Parameters
|Param|Description|
|---|---|
|`startTimestamp`|The timestamp marking the beginning of the time period.|
|`endTimestamp`|The timestamp marking the end of the time period.|

###### Return

**Type**

Long

**Description**

the elapsed time between the starting and ending timestamps, in milliseconds.

---
### Default Methods
##### `start()`

Starts, or resumes, measuring elapsed time for an interval.

##### `stop()`

Stops measuring elapsed time for an interval.

##### `reset()`

Stops time interval measurement and resets the elapsed time to zero.

##### `restart()`

Stops time interval measurement, resets the elapsed time to zero, and starts measuring elapsed time. Convenience method for replacing `reset/start` with a single `restart` call.

##### `getElapsedTime(Long startTimestamp)`

Returns the elapsed time since the `startingTimestamp` value.

###### Parameters
|Param|Description|
|---|---|
|`startTimestamp`|The timestamp marking the beginning of the time period.|

###### Return

**Type**

Long

**Description**

the elapsed time between the `startingTimestamp` and `now` retrieved using Stopwatch.getTimestamp(), in milliseconds.

---
### Abstract Methods
##### `getTimestamp()`

Returns the current timestamp.

###### Return

**Type**

Long

**Description**

the current timestamp, in milliseconds.

---
### Overriden Object Methods
##### `override toString()`

Returns a string representation of the current object.

###### Return

**Type**

String

**Description**

the string representation of the current object

---
