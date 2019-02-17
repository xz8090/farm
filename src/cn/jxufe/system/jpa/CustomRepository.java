/**
 * 
 */
package cn.jxufe.system.jpa;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public class CustomRepository<T, ID extends Serializable> extends SimpleJpaRepository<T, ID> implements JpaRepository<T, ID> {
	
	private static Logger logger = LoggerFactory.getLogger(CustomRepository.class);

	private final EntityManager entityManager;

	public CustomRepository(Class<T> domainClass, EntityManager em) {
		super(domainClass, em);
		// TODO Auto-generated constructor stub
		logger.debug("DomainClass : "+domainClass);
		entityManager = em;
	}

	public CustomRepository(final JpaEntityInformation<T, ?> entityInformation, final EntityManager entityManager) {
		super(entityInformation, entityManager);
		this.entityManager = entityManager;
		logger.debug("JpaEntityInformation : "+entityInformation);
	}

	public String sharedCustomMethod() {
		return "User defined sharedCustomMethod";
		// implementation goes here
	}
}