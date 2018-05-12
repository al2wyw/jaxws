package jvm;

import demoObject.BigObject;
import utils.ThreadUtils;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.locks.LockSupport;

/**
 * Created by johnny.ly on 2016/6/26.
 */
public class testSoftGC {
    //只有full gc才会回收weak reference，full gc后还没有空间则会回收soft reference
    private static List<SoftReference<Object>> object1s = new LinkedList<SoftReference<Object>>();

    private static ReferenceQueue<Object> queue = new ReferenceQueue<>();

    public static void main(String[] args) throws Exception{

        object1s.add(new SoftReference<Object>(new BigObject(),queue));
        object1s.add(new SoftReference<Object>(new BigObject(),queue));
        object1s.add(new SoftReference<Object>(new BigObject(),queue));

        for(int i=0;i<1000;i++){
            BigObject o = new BigObject();
            System.out.println(o);
            o = null;
            Object r;
            while((r = queue.poll())!=null){
                System.out.println("object from queue " + r);
            }
            //ThreadUtils.sleep(3000);
            LockSupport.parkNanos(1000000000L);
        }
    }
}
