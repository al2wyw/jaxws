package com.javassist;

import javassist.*;
import javassist.bytecode.*;
import javassist.bytecode.annotation.Annotation;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: johnny.ly
 * Date: 2018/10/30
 * Time: 23:57
 * Desc:
 *      ���������ļ����г���: ClassFile -> ConstPool, FieldInfo�� MethodInfo(code��attr����)��AttributeInfo(ӵ�кܶ�����) ConstPool�����ConstInfo(ӵ�кܶ�����)
 *                                 |                    |               |
 *                           CtClassType ->         CtField         CtMethod
 *      Javac(�������﷨��) -> JvstCodeGen(Visitor��ת�����ֽ���) -> Bytecode(���ɴ���ĺ��ģ�������cglib CodeEmitter)
 *      CtMethod.make ->  Javac ->  MethodInfo -> CtMethod --addedTo--> CtClassType
 *      ClassFileWriter: a util to generate class file, not easy to use(������asm ClassWriter)
 */
public class testAnnotationAndGeneric {
    public static void main( String args[] ) throws Exception{
        ClassPool pool = ClassPool.getDefault();//appendClassPath(new ClassClassPath(Object.class));
        pool.appendClassPath(new ClassClassPath(testAnnotationAndGeneric.class));//use testAnnotationAndGeneric.getResource() to load resource
        CtClass personKlass = pool.get("com.model.Person");
        System.out.println(personKlass.getName());

        CtClass cc = pool.makeClass("com.test.myClass");

        ClassFile ccFile = cc.getClassFile();
        ConstPool constpool = ccFile.getConstPool();

        // create the annotation
        AnnotationsAttribute attr = new AnnotationsAttribute(constpool, AnnotationsAttribute.visibleTag);
        Annotation annot = new Annotation("javax.annotation.Resource", constpool);
        attr.addAnnotation(annot);
        ccFile.addAttribute(attr);

        CtMethod method = CtNewMethod.make("public int code(Object c){ return 10;}", cc);//ֱ�Ӱ��ַ���parse���ֽ���,����javac
        //�Է�����˵����̬����generic signatureû��ʲô���壬������ø����ò���generic
        SignatureAttribute.TypeParameter typeParameter = new SignatureAttribute.TypeParameter("E");
        SignatureAttribute.TypeVariable typeVariable = new SignatureAttribute.TypeVariable("E");
        SignatureAttribute.TypeArgument typeArgument = new SignatureAttribute.TypeArgument(typeVariable);
        SignatureAttribute.ClassType classType = new SignatureAttribute.ClassType(List.class.getName(), new SignatureAttribute.TypeArgument[]{typeArgument});
        SignatureAttribute.MethodSignature methodSignature =
                new SignatureAttribute.MethodSignature(new SignatureAttribute.TypeParameter[]{typeParameter},
                        new SignatureAttribute.Type[]{typeVariable, classType},new SignatureAttribute.BaseType("int"),null);
        System.out.println(methodSignature.encode());
        method.getMethodInfo().addAttribute(new SignatureAttribute(constpool, methodSignature.encode()));//method.setGenericSignature(methodSignature.encode());
        method.getMethodInfo().addAttribute(attr);
        //���뷽������
        method.insertBefore("System.out.println(\"I'm a Programmer\");");
        cc.addMethod(method);
        cc.debugWriteFile();
        Class clazz = cc.toClass();
        System.out.println(clazz.isAnnotationPresent(Resource.class));
        Method method1 = clazz.getMethod("code",Object.class);
        Type[] types = method1.getTypeParameters();
        for(Type type: types){
            System.out.println("TypeParameter " + type.getTypeName());
        }
        types = method1.getGenericParameterTypes();
        for(Type type: types){
            System.out.println("GenericParameter " + type.getTypeName());
        }
        System.out.println(method1.isAnnotationPresent(Resource.class));
        System.out.println(method1.invoke(clazz.newInstance(), (Object) null));
    }
}
