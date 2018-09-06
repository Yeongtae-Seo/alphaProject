package com.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component	// component하면 다른데서 autowired로 쓸 수 있음
public class AuthMap {

	public static Map map = new HashMap<>();
}
