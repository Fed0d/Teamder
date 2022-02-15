package com.Fed0d.Teamder.repository;


import com.Fed0d.Teamder.entity.Message;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface MessageRepository extends PagingAndSortingRepository<Message, Long> {

}
