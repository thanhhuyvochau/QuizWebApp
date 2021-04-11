/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import ultis.DBUltils;
import mapper.MapperInterface;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public abstract class AbstractDao<T> {

    static Logger log = Logger.getLogger(AbstractDao.class.getName());

    public Vector<T> query(String sql, MapperInterface<T> rowMapper, Object... parameters) {
        Connection cnn = null;
        PreparedStatement pre = null;
        ResultSet result = null;
        Vector<T> list = null;
        try {
            cnn = DBUltils.getConnection();
            if (cnn != null) {
                pre = cnn.prepareStatement(sql);
                list = new Vector();
                if (parameters != null) {
                    setParameter(pre, parameters);
                }
                result = pre.executeQuery();
                while (result.next()) {
                    list.add(rowMapper.mapper(result));
                }
            }

        } catch (Exception e) {
            log.info(e.toString());
        } finally {
            try {
                if (result != null) {
                    result.close();
                } else if (pre != null) {
                    pre.close();
                } else if (cnn != null) {
                    cnn.close();
                }
            } catch (Exception e) {
                log.info(e.toString());
            }

        }
        return list;
    }

    public boolean updateQuery(String sql, Object... parameters) {
        Connection cnn = DBUltils.getConnection();
        PreparedStatement pre = null;

        if (cnn != null) {
            try {
                cnn.setAutoCommit(false);
                pre = cnn.prepareStatement(sql);
                if (parameters != null) {
                    setParameter(pre, parameters);
                }
                pre.executeUpdate();
                cnn.commit();
                return true;
            } catch (Exception e) {
                try {
                    cnn.rollback();
                } catch (SQLException ex) {
                    log.info(ex.toString());
                }
            } finally {
                try {
                    if (pre != null) {
                        pre.close();
                    }
                    if (cnn != null) {
                        cnn.close();
                    }

                } catch (Exception e) {
                    log.info(e.toString());
                }

            }

        }
        return false;
    }

    public static void setParameter(PreparedStatement pre, Object... parameters) {
        int index = 1;
        try {
            for (Object i : parameters) {
                if (i instanceof Boolean) {
                    pre.setBoolean(index, (Boolean) i);
                    index++;
                } else if (i instanceof String) {
                    pre.setString(index, (String) i);
                    index++;
                } else if (i instanceof Integer) {
                    pre.setInt(index, (Integer) i);
                    index++;
                } else if (i instanceof BigDecimal) {
                    pre.setBigDecimal(index, (BigDecimal) i);
                    index++;
                } else if (i instanceof Date) {
                    java.sql.Date date = new java.sql.Date(((Date) i).getTime());
                    pre.setDate(index, (java.sql.Date) date);
                    index++;
                }
            }
        } catch (Exception e) {

        }
    }
}
