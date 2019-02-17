/**
 * 
 */
package cn.jxufe.system.jpa;

import java.io.Serializable;

public interface JpaRepository<T, ID extends Serializable> extends org.springframework.data.jpa.repository.JpaRepository<T, ID> {
		String  sharedCustomMethod();
}