/**
 * @description A Stopwatch implementation based on the {@link System.currentTimeMillis()} timestamps.
 *
 * @see Stopwatch
 * @see Limits.getCpuTime
 *
 * @author Oleh Berehovskyi
 * 
 * @group Utils
 */
public inherited sharing class CurrentTimeStopwatch extends Stopwatch {

    // <editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Initializes a new CurrentTimeStopwatch instance, and starts measuring elapsed time.
     *
     * @return the Stopwatch that has just begun measuring elapsed time.
     */
    public static Stopwatch startNew() {
        final Stopwatch sw = new CurrentTimeStopwatch();
        sw.start();
        return sw;
    }
    // @end-group
    // </editor-fold>

    // <editor-fold desc="Instance Methods">
    // @start-group Instance Methods
    /**
     * @description Gets the current timestamp based on the {@link System.currentTimeMillis()} method.
     *
     * @return the current timestamp, in milliseconds.
     *
     * @see System.currentTimeMillis
     */
    public override Long getTimestamp() {
        return System.currentTimeMillis();
    }
    // @end-group
    // </editor-fold>

}