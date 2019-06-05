package com.epidial.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class StringUtil extends TagSupport {
    private static final long serialVersionUID = -2312310581852395045L;
    private String value;
    private String separator;
    private int index;

    @Override
    public int doStartTag() throws JspException {
        try {
            String data = value.split(separator)[index];
            pageContext.getOut().write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doStartTag();
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setSeparator(String separator) {
        this.separator = separator;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}