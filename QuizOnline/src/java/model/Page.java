/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Vector;

/**
 *
 * @author ADMIN
 */
public class Page implements Serializable{

    private Integer firstPage;
    private Integer lastPage;
    private Integer indexPage;
    private Integer pageNum;
    private Integer NumObjectInPage;
    private Integer totalRecordNum;

    public Page() {
        firstPage = 1;
        indexPage = firstPage;
        NumObjectInPage = 20;
        totalRecordNum = 0;
    }

    public Integer getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(Integer firstPage) {
        this.firstPage = firstPage;
    }

    public Integer getLastPage() {
        lastPage = getPageNum();
        return lastPage;
    }

    public Integer getIndexPage() {
        return indexPage;
    }

    public void setIndexPage(Integer indexPage) {
        this.indexPage = indexPage;
    }

    public Integer getPageNum() {
        Integer totalRecord = getTotalRecordNum();
        pageNum = (totalRecord / NumObjectInPage);
        if (totalRecord % NumObjectInPage > 0) {
            pageNum += 1;
        }
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getTotalRecordNum() {
        return totalRecordNum;
    }

    public void setTotalRecordNum(Vector listData) {
        this.totalRecordNum = listData.size();
    }

    public Integer getNumObjectInPage() {
        return NumObjectInPage;
    }

    public void setNumObjectInPage(Integer NumObjectInPage) {
        this.NumObjectInPage = NumObjectInPage;
    }

   
}
