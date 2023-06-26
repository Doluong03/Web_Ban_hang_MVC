package sof3021.luongddph27553.request;

public class Account {

    private String ma;
    private String matkhau;

    public Account() {
    }

    public Account(String ma, String matkhau) {
        this.ma = ma;
        this.matkhau = matkhau;
    }

    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }
}
