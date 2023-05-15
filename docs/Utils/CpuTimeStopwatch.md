# CpuTimeStopwatch

`APIVERSION: 57`

`STATUS: ACTIVE`

A Stopwatch implementation based on the Limits.getCpuTime() timestamps.


**See** [Stopwatch](/docs/Utils/Stopwatch.md)


**See** Limits.getCpuTime


**Author** Oleh Berehovskyi


**Group** Utils

## Methods
### Static Methods
##### `static startNew()`

Initializes a new CpuTimeStopwatch instance, and starts measuring elapsed time.

###### Return

**Type**

Stopwatch

**Description**

the Stopwatch that has just begun measuring elapsed time.

---
### Instance Methods
##### `override getTimestamp()`

Gets the current timestamp based on the Limits.getCpuTime() method.

###### Return

**Type**

Long

**Description**

the current timestamp, in milliseconds.


**See** Limits.getCpuTime

---
