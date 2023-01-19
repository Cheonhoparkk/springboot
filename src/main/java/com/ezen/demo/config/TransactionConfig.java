package com.ezen.demo.config;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.interceptor.NameMatchTransactionAttributeSource;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import lombok.AllArgsConstructor;

@Configuration
@AllArgsConstructor
@EnableAspectJAutoProxy
public class TransactionConfig {
	
	private final PlatformTransactionManager platformTransactionManager;
	
	Advisor advisor() {
		AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
		pointcut.setExpression("execution(* com.ezen.project..*Service.*(..))");
		return new DefaultPointcutAdvisor(pointcut, interceptor());
	}
	
	TransactionInterceptor interceptor() {
		TransactionInterceptor interceptor = new TransactionInterceptor();
		NameMatchTransactionAttributeSource nmtab = new NameMatchTransactionAttributeSource();
		RuleBasedTransactionAttribute rbta = new RuleBasedTransactionAttribute();
		RollbackRuleAttribute rra = new RollbackRuleAttribute(Exception.class);
		
		rbta.setRollbackRules(Collections.singletonList(rra));
		rbta.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		Map<String,TransactionAttribute> tranMap = new HashMap<>();
		tranMap.put("*", rbta);
		nmtab.setNameMap(tranMap);
		interceptor.setTransactionAttributeSource(nmtab);
		interceptor.setTransactionManager(platformTransactionManager);
		return interceptor;
		
		
	}
		
}
