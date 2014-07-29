package step2;

import java.io.ByteArrayInputStream; 
import java.io.InputStream; 
import java.io.StringWriter; 
import java.io.UnsupportedEncodingException; 
import java.util.ArrayList; 
import java.util.List; 

import javax.xml.bind.JAXBContext; 
import javax.xml.bind.JAXBException; 
import javax.xml.bind.Marshaller; 
import javax.xml.bind.Unmarshaller; 

/** 
*xml��JAVA�����໥ת�� 
*/ 
public class JAXB2Tester { 


/** 
* �����ɵ�xmlת��Ϊ���� 
* @param zClass ת��Ϊʵ���Ķ��������� 
* @param xmlPath ��Ҫת����xml·�� 
*/ 
public static Object xml2Bean(Class<?> zClass, String xml) { 
Object obj = null; 
JAXBContext context = null; 
if (null == xml || "".equals(xml) || "null".equalsIgnoreCase(xml) 
|| xml.length() < 1) 
return obj; 
try { 
context = JAXBContext.newInstance(zClass); 
// if without "utf-8", Invalid byte 2 of 2-byte UTF-8 sequence. 
InputStream iStream = new ByteArrayInputStream(xml.getBytes("utf-8")); 
Unmarshaller um = context.createUnmarshaller(); 
obj = (Object) um.unmarshal(iStream); 
return obj; 
} catch (JAXBException e) { 
e.printStackTrace(); 
}catch (UnsupportedEncodingException e) { 
e.printStackTrace(); 
} 
return obj; 
} 


public static String bean2Xml(Object bean) { 
String xmlString = null; 
JAXBContext context; 
StringWriter writer; 
if (null == bean) 
return xmlString; 
try { 
//������뽫����ת��Ϊxml 
context = JAXBContext.newInstance(bean.getClass()); 
Marshaller m = context.createMarshaller(); 
m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
writer = new StringWriter(); 
m.marshal(bean, writer); 
xmlString = writer.toString(); 
System.out.println(xmlString); 
return xmlString; 
} catch (Exception e) { 
e.printStackTrace(); 
} 
return xmlString; 
} 

}