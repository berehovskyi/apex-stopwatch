/**
 * @see Stopwatch
 * @see CpuTimeStopwatch
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD')
private class CpuTimeStopwatchTest {

    /**
     * @see Stopwatch.getElapsedTime
     * @see CpuTimeStopwatch.startNew
     */
    @IsTest
    private static void staticMethods() {
        // Given
        Long delayMs = 100L;
        Long ts = currentTimestamp();
        sleep(delayMs);
        Long ts1 = currentTimestamp();
        Stopwatch sw = CpuTimeStopwatch.startNew();
        Stopwatch sw1 = new CpuTimeStopwatch();
        Stopwatch sw2 = new CpuTimeStopwatch();
        Stopwatch sw3 = sw2;
        // When
        Long elapsedTime = Stopwatch.getElapsedTime(ts, ts1);
        Long elapsedTime1 = Stopwatch.getElapsedTime(ts, ts);
        Long elapsedTime2 = Stopwatch.getElapsedTime(ts1, ts1);
        Long elapsedTime3 = Stopwatch.getElapsedTime(ts1, ts);
        sleep(delayMs);
        sw.stop();

        sw1.start();
        sleep(delayMs * 2);
        sw1.stop();

        sw2.start();
        sleep(delayMs);
        sw2.stop();
        // Then
        Assert.isTrue(elapsedTime >= delayMs);
        Assert.isTrue(elapsedTime1 == 0);
        Assert.isTrue(elapsedTime2 == 0);
        Assert.isTrue(elapsedTime3 <= -delayMs);
        Assert.isTrue(sw.elapsed >= delayMs);
        Assert.isTrue(sw1.elapsed >= delayMs * 2);
        Assert.areNotEqual(sw1, sw2);
        Assert.areEqual(sw2.elapsed, sw3.elapsed);
    }

    /**
     * @see Stopwatch.start
     * @see Stopwatch.stop
     * @see Stopwatch.reset
     * @see Stopwatch.restart
     */
    @IsTest
    private static void defaultMethods() {
        // Given
        Long delayMs = 100L;
        Stopwatch sw = new CpuTimeStopwatch();
        Stopwatch sw1 = new CpuTimeStopwatch();
        // When
        Long ts = currentTimestamp();
        Assert.isTrue(!sw.isRunning);
        sw.start();
        sleep(delayMs);
        Long elapsedTime = sw.getElapsedTime(ts);
        sleep(delayMs);
        Long currentElapsedTime = sw.elapsed;
        Assert.isTrue(sw.isRunning);
        sw.stop();
        Assert.isTrue(!sw.isRunning);
        Assert.isTrue(sw.elapsed >= delayMs * 2);

        Assert.isTrue(!sw1.isRunning);
        Assert.isTrue(sw1.elapsed == 0);
        sw1.start();
        Assert.isTrue(sw1.isRunning);
        sleep(delayMs);
        sw1.stop();
        Assert.isTrue(!sw1.isRunning);
        Assert.isTrue(sw1.elapsed >= delayMs);
        sw1.reset();
        Assert.isTrue(!sw1.isRunning);
        Assert.isTrue(sw1.elapsed == 0);
        sw1.restart();
        sleep(delayMs);
        Assert.isTrue(sw1.isRunning);
        Assert.isTrue(sw1.elapsed >= delayMs);
        sw1.stop();
        Assert.isTrue(!sw1.isRunning);
        Assert.isTrue(sw1.elapsed >= delayMs);
        // Then
        Assert.isTrue(elapsedTime >= delayMs);
        Assert.isTrue(currentElapsedTime >= delayMs * 2);
        Assert.areEqual(
            sw.toString(),
            String.format(Label.ASW_Message_ToString, new List<Object>{ sw.elapsed, sw.isRunning })
        );
        Assert.areEqual(
            sw1.toString(),
            String.format(Label.ASW_Message_ToString, new List<Object>{ sw1.elapsed, sw.isRunning })
        );
    }

    private static Long currentTimestamp() {
        return Limits.getCpuTime();
    }

    private static void sleep(Long millis) {
        final Long startTimestamp = currentTimestamp();
        while (currentTimestamp() - startTimestamp <= millis);
    }

}
