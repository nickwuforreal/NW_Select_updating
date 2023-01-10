package com;

public class OrderItem {
    private Integer id ;
    private Product book ;                 //M:1
    private Integer buyCount ;
    private OrderBean orderBean ;       //M:1

    public OrderItem(){}

    public OrderItem(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Product getBook() {
        return book;
    }

    public void setBook(Product book) {
        this.book = book;
    }

    public Integer getBuyCount() {
        return buyCount;
    }

    public void setBuyCount(Integer buyCount) {
        this.buyCount = buyCount;
    }

    public OrderBean getOrderBean() {
        return orderBean;
    }

    public void setOrderBean(OrderBean orderBean) {
        this.orderBean = orderBean;
    }
}
