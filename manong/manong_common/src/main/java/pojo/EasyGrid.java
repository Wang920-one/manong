package pojo;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: hengjun
 * Date: 2019/6/15
 */
//DataGrid 需要返回的 JSON 数据
public class EasyGrid {

    private int total;
    private List<?> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }
}
