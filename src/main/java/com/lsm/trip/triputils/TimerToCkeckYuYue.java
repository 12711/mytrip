package com.lsm.trip.triputils;

import com.lsm.trip.dto.OrderScane;
import com.lsm.trip.service.OrderScaneService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lv on 2017/5/8.
 */
public class TimerToCkeckYuYue implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("容器启动了..");
        startToCheck(servletContextEvent);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    private static void startToCheck(ServletContextEvent servletContextEven){

        ApplicationContext applicationContext= WebApplicationContextUtils.getWebApplicationContext(servletContextEven.getServletContext());

        Timer timer=new Timer();
        Calendar calendar=Calendar.getInstance();
        Calendar calendarTonigt=Calendar.getInstance();
        calendarTonigt.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DAY_OF_MONTH));
        calendarTonigt.set(Calendar.HOUR_OF_DAY,24);
        calendarTonigt.set(Calendar.MINUTE,0);
        calendarTonigt.set(Calendar.SECOND,0);
        //获得当前时间距离晚上零点还有多久
        Long time=calendarTonigt.getTimeInMillis()-calendar.getTimeInMillis();
        //每天的零点开始执行
        timer.schedule(new TimerTask() {

            @Override
            public void run() {
                //获得orderScaneService对象
                OrderScaneService orderScaneService= (OrderScaneService)applicationContext.getBean("orderScaneService", OrderScaneService.class);

                try {
                    List<OrderScane> orderScanes=orderScaneService.gerOrderScanes();

                    if(orderScanes!=null){
                        for(OrderScane orderScane:orderScanes ){
                            String dateString=orderScane.getPosttime();
                            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            //解析得到date类型的申请日期
                            Date posttime=format.parse(dateString);
                            Calendar calendarPostime=Calendar.getInstance();
                            calendarPostime.setTime(posttime);
                            //获取七天后的申请时间
                            calendarPostime.set(Calendar.DAY_OF_MONTH,calendarPostime.get(calendarPostime.DAY_OF_MONTH)+7);


                            Calendar calendarNow=Calendar.getInstance();
                            Date now=new Date();
                            calendarNow.setTime(now);
                            //如果当前时间超过了申请后的第七天则改变申请状态
                             if(now.getTime()-calendarPostime.getTime().getTime()>0){
                                 orderScane.setStatus(1);
                                 orderScaneService.updateStatus(orderScane);
                                 System.out.println("已过期"+orderScane.getOrder_id());
                             }

                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("处理失败..!");
                }
            }
        }, time, 24*60*60*1000);

    }
}
