package com.Fed0d.Teamder.repository;

import com.Fed0d.Teamder.entity.Dialog;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DialogRepository extends PagingAndSortingRepository<Dialog, Long> {
    List<Dialog> findByUser1_IdOrUser2_Id(Long id, Long id1);

    Optional<Dialog> findByUser1_IdAndUser2_Id(Long id, Long id1);

}
