/**
 * @description A lightweight class that is designed to measure the duration of a single interval
 * or the cumulative duration over multiple intervals.
 * <ul>
 *     <li>The {@link Stopwatch.start()} method is typically initiated, followed by the {@link Stopwatch.stop()} method,
 * and the elapsed time can be reviewed using the {@link Stopwatch.elapsed} property.</li>
 *     <li>A Stopwatch instance can either be in a running or a stopped state.
 * The current state can be verified using the {@link Stopwatch.isRunning} property.</li>
 *     <li>The {@link Stopwatch.start()} method is used to begin the time measurement process,
 * while the {@link Stopwatch.stop()} method is employed to halt it.</li>
 *     <li>The elapsed time can be obtained through the {@link Stopwatch.elapsed} property.
 * This property can be accessed regardless of whether the Stopwatch is running or stopped.
 * The values of the property continue to increase when the Stopwatch is operational
 * and remain constant when it's stopped.</li>
 *     <li>The {@link Stopwatch.elapsed} value of a Stopwatch instance, by default,
 * equals the sum of all the measured time intervals.</li>
 *     <li>Each call to {@link Stopwatch.start()} is initiated from the point of cumulative elapsed time,
 * while each call to {@link Stopwatch.stop()} concludes the current interval measurement and solidifies
 * the cumulative elapsed time value.</li>
 *     <li>The cumulative elapsed time in an existing Stopwatch instance can be cleared
 * using the {@link Stopwatch.reset()} method.</li>
 *     <li>The {@link Stopwatch.restart()} is the convenience method 
 * for replacing {@link Stopwatch.reset()} and {@link Stopwatch.start()} with a single call.</li>
 * </ul>
 *
 * @author Oleh Berehovskyi
 * 
 * @group Utils
 */
public abstract inherited sharing class Stopwatch {

    // <editor-fold desc="Fields">
    // @start-group Fields
    private Long elapsedTime = 0;
    private Long startTimestamp = 0;
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Properties">
    // @start-group Properties
    /**
     * @description Returns the total elapsed time measured by the current instance, in milliseconds.
     */
    public Long elapsed {
        get {
            return getElapsedTime();
        }
    }

    /**
     * @description Returns a value indicating whether the Stopwatch timer is running.
     */
    public Boolean isRunning {
        get {
            return isRunning;
        }
        private set;
    } {
        isRunning = false;
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns the elapsed time between two timestamps.
     *
     * @param startTimestamp The timestamp marking the beginning of the time period.
     * @param endTimestamp The timestamp marking the end of the time period.
     *
     * @return the elapsed time between the starting and ending timestamps, in milliseconds.
     */
    public static Long getElapsedTime(final Long startTimestamp, final Long endTimestamp) {
        return endTimestamp - startTimestamp;
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Starts, or resumes, measuring elapsed time for an interval.
     */
    public virtual void start() {
        if (!isRunning) {
            startTimestamp = getTimestamp();
            isRunning = true;
        }
    }

    /**
     * @description Stops measuring elapsed time for an interval.
     */
    public virtual void stop() {
        // Calling stop on a stopped Stopwatch is a no-op.
        if (isRunning) {
            elapsedTime += getTimestamp() - startTimestamp;
            // When measuring small time periods it is possible to get negative values
            elapsedTime = elapsedTime < 0 ? 0 : elapsedTime;
            isRunning = false;
        }
    }

    /**
     * @description Stops time interval measurement and resets the elapsed time to zero.
     */
    public virtual void reset() {
        elapsedTime = 0;
        startTimestamp = 0;
        isRunning = false;
    }

    /**
     * @description Stops time interval measurement, resets the elapsed time to zero,
     * and starts measuring elapsed time.
     * Convenience method for replacing `reset/start` with
     * a single `restart` call.
     */
    public virtual void restart() {
        elapsedTime = 0;
        startTimestamp = getTimestamp();
        isRunning = true;
    }

    /**
     * @description Returns the elapsed time since the `startingTimestamp` value.
     *
     * @param startTimestamp The timestamp marking the beginning of the time period.
     *
     * @return the elapsed time between the `startingTimestamp` and `now`
     * retrieved using {@link Stopwatch.getTimestamp()}, in milliseconds.
     */
    public virtual Long getElapsedTime(final Long startTimestamp) {
        return getElapsedTime(startTimestamp, getTimestamp());
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Abstract Methods">
    // @start-group Abstract Methods
    /**
     * @description Returns the current timestamp.
     *
     * @return the current timestamp, in milliseconds.
     */
    public abstract Long getTimestamp();
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Protected Methods">
    // @start-group Protected Methods
    protected Long getElapsedTime() {
        Long result = elapsedTime;
        if (isRunning) {
            // If the Stopwatch is running, add elapsed time since the Stopwatch is started last time.
            result += getTimestamp() - startTimestamp;
        }
        return result;
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Overriden Object Methods">
    // @start-group Overriden Object Methods
    /**
     * @description Returns a string representation of the current object.
     *
     * @return the string representation of the current object
     */
    public override String toString() {
        return String.format(Label.ASW_Message_ToString, new List<Object>{ elapsed, isRunning });
    }
    // @end-group
    // </editor-fold>
    
}