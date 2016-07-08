package kr.co.hucloud.utilities.cache.ehcache;

import java.util.List;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.springframework.cache.ehcache.EhCacheCacheManager;

public class EhCacheUtil {

	private Cache cache;
	
	public EhCacheUtil(EhCacheCacheManager ehCacheCacheManager, String cacheName) {
		cache = ehCacheCacheManager.getCacheManager().getCache(cacheName);
	}
	
	public <T> void put(String key, T value) {
		if(cache.get(key) != null) {
			cache.remove(key);
		}
		
		cache.put(new Element(key, value));
		
		/*
		System.out.println(cache.getSize());
		
		List<String> keys = cache.getKeys();
		for(String keyy : keys) {
			System.out.println(keyy);
			System.out.println(get(keyy));
		}
		*/
	}
	
	public <T> T get(String key) {
		Element element = cache.get(key);
		return (T) element.getObjectValue();
	}
	
	public void remove(String key) {
		cache.remove(key);
	}
	
}
