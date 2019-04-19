package com.validation;

import org.hibernate.validator.HibernateValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;

import javax.validation.MessageInterpolator;
import java.util.Locale;

/**
 * Created by IntelliJ IDEA.
 * User: johnny.ly
 * Date: 2019/1/13
 * Time: 19:57
 * Desc:
 Bean Validation 1.1��ǰʵ����Hibernate validator 5����spring4��֧�֡����������Ǵ����¼�����������Bean Validation 1.1����Ȼ��һ���������ԣ�
 ����Bean Validation 1.1��SpringMVC
 ������֤������˳�򼰼�����֤ (�Ƚ�����)
 ��Ϣ��ʹ��EL���ʽ
 ��������/����ֵ��֤
 �Զ�����֤����
 �༶����֤��
 �ű���֤��
 cross-parameter���������֤
 ����༶����֤���Ϳ������֤��
 ��϶����֤ע��
 ���ػ�
 */
@Configuration
public class ValidationConfig {

    @Bean
    public MethodValidationPostProcessor methodValidationPostProcessor(){
        return new MethodValidationPostProcessor();
    }

    //���� Validator, ����ע�뵽������������ֶ�У��
    /*@Bean
    public LocalValidatorFactoryBean LocalValidatorFactoryBean(){
        LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
        localValidatorFactoryBean.setProviderClass(HibernateValidator.class);
        return localValidatorFactoryBean;
    }*/
}
