/**
 * @description A Stopwatch implementation based on the {@link Limits.getCpuTime()} timestamps.
 *
 * @see Stopwatch
 * @see Limits.getCpuTime
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class CpuTimeStopwatch extends Stopwatch {

    // <editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Initializes a new CpuTimeStopwatch instance, and starts measuring elapsed time.
     *
     * @return the Stopwatch that has just begun measuring elapsed time.
     */
    public static Stopwatch startNew() {
        final Stopwatch sw = new CpuTimeStopwatch();
        sw.start();
        return sw;
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Instance Methods">
    // @start-group Instance Methods
    /**
     * @description Gets the current timestamp based on the {@link Limits.getCpuTime()} method.
     *
     * @return the current timestamp, in milliseconds.
     *
     * @see Limits.getCpuTime
     */
    public override Long getTimestamp() {
        return Limits.getCpuTime();
    }
    // @end-group
    // </editor-fold>

}
