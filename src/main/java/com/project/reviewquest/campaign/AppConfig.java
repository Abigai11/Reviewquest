package com.project.reviewquest.campaign;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class AppConfig {

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("utf-8"); // 필요에 따라 문자 인코딩 설정
        resolver.setMaxUploadSize(5 * 1024 * 1024); // 파일 크기 제한 설정 (예: 5MB)
        return resolver;
    }
}
