package com;

//我们应该还需要设计一个Cart类，代表购物车这个实体
public class CartItem {
    private Integer id ;
    private Product book ;
    private Integer buyCount ;
    private Member uesr ;

    public CartItem(){}

    public CartItem(Integer id) {
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

    public Member getUesr() {
        return uesr;
    }

    public void setUesr(Member uesr) {
        this.uesr = uesr;
    }
}
