package com.asm;

/**
 * Created by IntelliJ IDEA.
 * User: win10
 * Date: 2019/7/7
 * Time: 18:29
 * Desc: check bytecode outline to see frame
 *       visitFrame -> the first arg ???
 *       compute_frame -> getCommonSuperClass ???
 *       stackMap Frame: ִ��ĳһ�ض��ֽ���ǰ��ÿ���ֲ������ۺ�ÿ���������۰�����ֵ������(��Ϊcompressed��expanded)
 *       ��ʼ֡�ɲ������ɣ�ÿ����תָ����Ҫ���¼���֡����ʱ��ǰһ֡(�����ʼ֡)���Ƚ� ��ʵ�����Ӻ����������ӵ� ???��
 *       failed !!!
 */
public class StackMapFrameTest {
    public static void main( String args[] ) {

        String i = "test";
        if(i.contains("t1")){
            int m = 10;
            if(i.contains("t12")){
                int h = 10;
            }
            int n = 11;
        }

        if(i.contains("t2")){
            int m = 10;
        }

        if(i.contains("t3")){
            int m = 10;
        }

        String o = "111";
        System.out.println(o);
    }
}