package woven_aspect;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Documented

public @interface ConsMonitor {
	String value() default "";
}
