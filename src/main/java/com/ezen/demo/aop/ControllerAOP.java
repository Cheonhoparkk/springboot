package com.ezen.demo.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class ControllerAOP {

	@Around("execution(public*com.ezen.demo.controller..*Controller.*(..))")
	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable {
		Object ojb = pjp.proceed();
		if(ojb==null) {
			log.debug("type of=>null");
			return null;
		}
		log.debug("type=>{}", ojb.getClass());
		return ojb;
	}
}
