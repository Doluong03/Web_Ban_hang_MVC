package sof3021.luongddph27553.configuration;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MapingConfig {
    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }
}
