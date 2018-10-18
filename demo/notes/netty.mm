<?xml version="1.0" encoding="UTF-8" standalone="no"?><map version="0.8.1"><node CREATED="1536504127885" ID="5rn7stmlsrau2hujjlalhlqnhp" MODIFIED="1536504127885" TEXT="netty"><node CREATED="1536504127885" ID="1k55pnt8k01gorf69b2hmvfphc" MODIFIED="1536504127885" POSITION="right" TEXT="粘包/拆包"><node CREATED="1536504127885" ID="0391odoaun6enpogi2q22q36li" MODIFIED="1536504127885" TEXT="上层数据比TCP包大或者小，导致粘合和拆分"/><node CREATED="1536504127885" ID="5miur51729d8td6unkj18oi4d7" MODIFIED="1536504127885" TEXT="解决方案"><node CREATED="1536504127885" ID="7r5m3vvn4d7ahheu0e5p2sgbkh" MODIFIED="1536504127885" TEXT="定长消息，不满则补充完整(FIxedLengthFrameDecoder)"/><node CREATED="1536504127885" ID="37tqd7r00l30v43j92q4qkmlu4" MODIFIED="1536504127885" TEXT="将换行符作为结束符 LineBasedFrameDecoder(&quot;\n&quot;, &quot;\r\n&quot;)"/><node CREATED="1536504127885" ID="3i3g18l06hdvsf0tbhpslhutsv" MODIFIED="1536504127885" TEXT="将特殊符号作为结束符 DelimiterBasedFrameDecoder"/><node CREATED="1536504127885" ID="66h7e52bftah36au61kdt3ejjk" MODIFIED="1536504127885" TEXT="通过消息头说明消息长度, 制定应用层协议"/></node></node><node CREATED="1536504127885" ID="5oshntgoh47dcasg8op09g2uto" MODIFIED="1536504127885" POSITION="right" TEXT="序列化技术"><node CREATED="1536504127885" ID="3bosmbt11qjradc91qgk769m6f" MODIFIED="1536504127885" TEXT="jdk序列化"><node CREATED="1536504127885" ID="6dsc6q3skmm6ci1bn1i3a0b4b3" MODIFIED="1536504127885" TEXT="无法跨语言, 无法进行异构语言交互"/><node CREATED="1536504127885" ID="298ljk7c0c2d00id40tisutolp" MODIFIED="1536504127885" TEXT="序列化后的字节数据太大"/><node CREATED="1536504127885" ID="2bq0gkkhaps3gg01f9lhj8tqvc" MODIFIED="1536504127885" TEXT="序列化反序列化性能低下"/></node><node CREATED="1536504127885" ID="6egvr8vljgf1vc5h0lptcv8o8v" MODIFIED="1536504127885" TEXT="Protobuf"><node CREATED="1536504127885" ID="0illgv3bf50kkvql5alc3ejva5" MODIFIED="1536504127885" TEXT="结构化数据存储格式(xml , json等)"/><node CREATED="1536504127885" ID="3p5inivlga32te14agpjfe4bqp" MODIFIED="1536504127885" TEXT="性能高效"/><node CREATED="1536504127885" ID="1q7ids4acienihq4dnmr3bq8v3" MODIFIED="1536504127885" TEXT="语言无关，平台无关，可扩展"/><node CREATED="1536504127885" ID="54uf3pnnnqeqvn72d54ceqcat3" MODIFIED="1536504127886" TEXT="使用二进制编码，空间和性能上有优势"/><node CREATED="1536504127886" ID="2rkqva9ngtup527mk5mn9u8e3m" MODIFIED="1536504127886" TEXT="使用数据描述文件进行结构说明"/></node><node CREATED="1536504127886" ID="4taqfcuhshbajn3rgujf9qimiq" MODIFIED="1536504127886" TEXT="Thrift的TProtocol"><node CREATED="1536504127886" ID="2fdhlu0cqr824gs0vbi6dpm8tk" MODIFIED="1536504127886" TEXT="通过IDL进行接口和数据结构定义"/><node CREATED="1536504127886" ID="70srq7bf4t1auq1ksf715de8i5" MODIFIED="1536504127886" TEXT="使用二进制编码，可压缩"/></node></node><node CREATED="1536504127886" ID="3jbbn1shqeckrtejf3ou44rdhu" MODIFIED="1536504127886" POSITION="right" TEXT="私有协议开发"><node CREATED="1536504127886" ID="2g50rkn3jk8vbdn6v8vd5ogcc6" MODIFIED="1536504127886" TEXT="通信模型设计"><node CREATED="1536504127886" ID="6brnor85nkqgod2r3mhf48d6kn" MODIFIED="1536504127886" TEXT="业务请求与应答"/><node CREATED="1536504127886" ID="7p4or3quduiakrrramd03flu6b" MODIFIED="1536504127886" TEXT="心跳请求与应答"/><node CREATED="1536504127886" ID="0gncn6r7vot2r5sdfkps35d829" MODIFIED="1536504127886" TEXT="链路关闭"/></node><node CREATED="1536504127886" ID="3egojv485rmii5v0rhek41l9ud" MODIFIED="1536504127886" TEXT="可靠性设计"><node CREATED="1536504127886" ID="2vdeg9toa8d0mmdsigk9pksa2t" MODIFIED="1536504127886" TEXT="心跳机制，客户端发起，服务端回应 (连续心跳失败后关闭连接)"/><node CREATED="1536504127886" ID="1b3pm4jnagnf9s7mgotm0lsk6l" MODIFIED="1536504127886" TEXT="重连机制 (断开后需要等待一段时间再发起重连，保证对方有时间释放socket资源)"/><node CREATED="1536504127886" ID="3e5uhbd8o2omqd5jcsbctiohnp" MODIFIED="1536504127886" TEXT="重复连接诊断 (不允许客户端重复连接)"/><node CREATED="1536504127886" ID="0735g81ireq6qmr3f89b5urha1" MODIFIED="1536504127886" TEXT="消息缓存重发 (链路断开后再次连接前保存未发送的消息)"/></node><node CREATED="1536504127886" ID="1r9g9tqbokq9brsi8jucp2rcp4" MODIFIED="1536504127886" TEXT="其他是协议开发代码讲解，没必要记录"/></node><node CREATED="1536504127886" ID="07nj520o6ivha8ng3g6d03h53i" MODIFIED="1536504127886" POSITION="right" TEXT="源码分析"><node CREATED="1536504127886" ID="2mr0v8mhgm1qdf18jt0nafl54t" MODIFIED="1536504127886" TEXT="源码从 13章服务端创建 开始 p294，未全部读完"/><node CREATED="1536504127886" ID="0cbdm720nb3ovvoqf1eo4dmg8r" MODIFIED="1536504127886" TEXT="服务端创建"><node CREATED="1536504127886" ID="2hduqmj4h925okdg2g8rp2qba1" MODIFIED="1536504127886" TEXT="EventLoop 负责IO 以及 所有的task和schedule task，避免了多线程并发竞争，提高了线程处理性能"/><node CREATED="1536504127886" ID="3vmde6t3ko398o5qa91pt3hus5" MODIFIED="1536504127886" TEXT="selectionKey = javaChannel().register(eventLoop().selector, 0, this); 这里注册0是因为doRegister方法是多态的，server和client端都使用，不能写死Accept，后续由HeadHandler调用selectionKey去interest不同的事件(屌)"/></node><node CREATED="1536504127886" ID="2d2dfk8r2via3sfb7bmnl9sq70" MODIFIED="1536504127886" TEXT="ByteBuf和相关辅助类"><node CREATED="1536504127886" ID="5g2let6nsir9h29cl1v4t8or9a" MODIFIED="1536504127886" TEXT="原始ByteBuff的缺点"><node CREATED="1536504127886" ID="0deml24i0g6h82ljb1s7117e73" MODIFIED="1536504127886" TEXT="长度固定，无法动态扩容，POJO对象太大容易发生越界"/><node CREATED="1536504127886" ID="4s42lhl1gm7fdrovfurbllmc58" MODIFIED="1536504127886" TEXT="只有一个标识位置的字段，使用时复杂而且容易犯错"/><node CREATED="1536504127886" ID="06luk15l4ncb1076tme75allkc" MODIFIED="1536504127886" TEXT="API功能有限，无法实现高级功能"/></node><node CREATED="1536504127886" ID="29gtt868lplu8gpjje8dpho464" MODIFIED="1536504127886" TEXT="ByteBuf的工作原理"><node CREATED="1536504127886" ID="6gscstt1qtj400fhq7trcn8up2" MODIFIED="1536504127886" TEXT="通过两个位置指针readerIndex和writerIndex来区分读写位置&#13;&#10;(0, -&gt;  readerIndex, -&gt; writerIndex, -&gt; capacity)&#13;&#10;(整个区域被划分成三块: discardable bytes, readable bytes, writable bytes)"/><node CREATED="1536504127886" ID="28q6vpr144qaagm93locded66b" MODIFIED="1536504127886" TEXT="写操作自动进行动态扩容"/><node CREATED="1536504127886" ID="1g8inta75rvsj75ladqhif5g47" MODIFIED="1536504127886" TEXT="discardable bytes会导致字节数组复制，writable bytes的处理和接口具体实现有关(setBytes为0)"/><node CREATED="1536504127886" ID="6aafg7ptff3hogqm7bs16b0hm6" MODIFIED="1536504127886" TEXT="clear操作，只是重置index，并没有清除内容"/><node CREATED="1536504127886" ID="7hf4al349vuiu22ulqrr8t3b43" MODIFIED="1536504127886" TEXT="mark和reset， mark当前位置，然后reset会到mark的位置"/></node><node CREATED="1536504127886" ID="4etf7ovnnkr55pmdlui1p927k6" MODIFIED="1536504127886" TEXT="ByteBuf的源码分析"><node CREATED="1536504127886" ID="57onik57suec6fuldjdnqgvqha" MODIFIED="1536504127886" TEXT="堆内存(分配快，可以JVM自动回收，SOCKET进行IO需要额外拷贝)和直接内存(相反)，在IO读写缓存区使用直接内存，消息编解码使用堆内存，是最佳实践"/><node CREATED="1536504127886" ID="6f1ite03id8a1i6gu4gjvn4vrh" MODIFIED="1536504127886" TEXT="池化后，提升内存使用效率，降低频繁GC，在高并发下GC和内存更加平稳"/></node></node><node CREATED="1536504127886" ID="3qqjd81e7tcbcpsf4s23bpo738" MODIFIED="1536504127886" TEXT="Channel和Unsafe"/></node><node CREATED="1536504127886" ID="5chjk8qq0ja9k2f41o3ua9sf2v" MODIFIED="1536504127886" POSITION="right" TEXT="架构设计"><node CREATED="1536504127886" ID="01su4khmtk8suaov0hm70h4m10" MODIFIED="1536504127886" TEXT="逻辑架构"><node CREATED="1536504127886" ID="18bhpfrtl92t378hblv5fovtjb" MODIFIED="1536504127886" TEXT="Reactor通信层(能力沉淀)"/><node CREATED="1536504127886" ID="1521u9dtc3i7ebkpujf1nfsn3r" MODIFIED="1536504127886" TEXT="责任链Pipeline层(扩展的触发)"/><node CREATED="1536504127886" ID="1g8vroi16hp7gthhft9b6tknim" MODIFIED="1536504127886" TEXT="业务编排层ChannelHandler(扩展口)"/></node><node CREATED="1536504127886" ID="60ujhp2terrt8a8b9ljppvq6lo" MODIFIED="1536504127886" TEXT="关键架构质量"><node CREATED="1536504127886" ID="0jru1td9rurb3mvbkovv1r65ld" MODIFIED="1536504127886" TEXT="高性能 ......"/><node CREATED="1536504127886" ID="1fqqhot32b78r4effs3q51vn9c" MODIFIED="1536504127886" TEXT="可靠性 ........"/><node CREATED="1536504127886" ID="6jprqosucj4r2lact4poq5vnap" MODIFIED="1536504127886" TEXT="可扩展性"/></node></node><node CREATED="1536504127886" ID="6nlj4lh4dphdv228ul819thp32" MODIFIED="1536504127886" POSITION="left" TEXT="高性能之道"><node CREATED="1536504127886" ID="2odd0cj32irvs7m6cj5avtgerh" MODIFIED="1536504127886" TEXT="异步非阻塞通信(EventLoop的设计, 所有IO接口的非阻塞特性)"/><node CREATED="1536504127886" ID="21hlgcgcf9c7ul3a6tpujqh4tb" MODIFIED="1536504127886" TEXT="高效的Reactor线程模型"/><node CREATED="1536504127886" ID="53a5sgblohkg932j06git4u7ve" MODIFIED="1536504127886" TEXT="高效并发编程(CAS和volatile的正确使用)"/><node CREATED="1536504127886" ID="7pvdf3m5nf75dr9e43eog81s29" MODIFIED="1536504127886" TEXT="串行无锁化pipeline"/><node CREATED="1536504127886" ID="2n8jrv937110p45ssra2ki8o6r" MODIFIED="1536504127886" TEXT="零拷贝"/><node CREATED="1536504127886" ID="48p4c38qb4p1ne4p1lrdh9qthm" MODIFIED="1536504127886" TEXT="内存池"/><node CREATED="1536504127886" ID="37a4ue04hd3gkmabgb28ccgk2p" MODIFIED="1536504127886" TEXT="灵活的TCP参数配置"/></node><node CREATED="1536504127886" ID="0v1hq4i5hljaknpi0o6vtoakl1" MODIFIED="1536504127886" POSITION="left" TEXT="可靠性"><node CREATED="1536504127886" ID="7qlf7iaq5ucs6adi3r02v0m9n4" MODIFIED="1536504127886" TEXT="可靠性设计"><node CREATED="1536504127886" FOLDER="true" ID="7c8d2c1nl9e0hhcrko6dhkbvuj" MODIFIED="1536504127886" TEXT="网络通信类故障"><node CREATED="1536504127886" ID="1vjc07jt13nl23s6pdpidb9mqm" MODIFIED="1536504127886" TEXT="客户端连接超时"/><node CREATED="1536504127886" ID="7libhkc816133mvniffb7kelac" MODIFIED="1536504127886" TEXT="通信对端强制关闭(对方进程结束，发生IOException)"/><node CREATED="1536504127886" ID="3m9lj0n5dhn08bg5coko4s6277" MODIFIED="1536504127886" TEXT="链路关闭(read就绪，并且返回-1)"/><node CREATED="1536504127886" ID="1d0ma8beveqdmb23nh9u5ietqq" MODIFIED="1536504127886" TEXT="通信对端假死 ??? 没有涉及"/><node CREATED="1536504127886" ID="2iq9ae7jfstbmlc29q3d4ocioi" MODIFIED="1536504127886" TEXT="定制IO故障，channelHandler的exceptionCaught进行监听处理"/></node><node CREATED="1536504127886" FOLDER="true" ID="67i1ia4jilsddblsohu1nsk0ao" MODIFIED="1536504127886" TEXT="链路有效性检测"><node CREATED="1536504127886" ID="4kq98phhekgiohg0h095mfcgk3" MODIFIED="1536504127886" TEXT="心跳检测机制"><node CREATED="1536504127886" ID="5kqr5rmii2rle1chkgmh5llc34" MODIFIED="1536504127886" TEXT="TCP层面的心跳检测"/><node CREATED="1536504127886" ID="7mh50h7km9ijv2lbi0f87hj1m1" MODIFIED="1536504127886" TEXT="协议层的心跳检测，如SMPP的协议"/><node CREATED="1536504127886" ID="19k3srjdn90phk15gudv6gjj1a" MODIFIED="1536504127886" TEXT="应用层的心跳检测，业务方定制"/></node><node CREATED="1536504127886" ID="04gbcvqr8tft5sn01ocmnessuf" MODIFIED="1536504127886" TEXT="心跳策略"><node CREATED="1536504127886" ID="1jlqcdc39bo4nfjborh4b6hi58" MODIFIED="1536504127886" TEXT="连续N次心跳检测对方无应答，称作心跳超时"/><node CREATED="1536504127886" ID="5iiugdo4a5h92ih7mlq43ncd90" MODIFIED="1536504127886" TEXT="读取或发生心跳消息时IO异常，称作心跳失败"/></node><node CREATED="1536504127886" ID="3hg7c8rvthdctqooae3lbjv155" MODIFIED="1536504127886" TEXT="ReadTimeoutHandler， WriteTimeoutHandler， IdleStateHandler"/></node><node CREATED="1536504127886" FOLDER="true" ID="2di9hl6dfsmrvqbkbniak33dj3" MODIFIED="1536504127886" TEXT="Reactor线程的保护"><node CREATED="1536504127886" ID="1lv1elaape201m4gf678hpqv5m" MODIFIED="1536504127886" TEXT="异常处理要谨慎(NioEventLoop的run方法，catch Throwable, 并睡眠1s, 防止死循环)"/><node CREATED="1536504127886" ID="2vtto1mmj7v0j41fug6328gsua" MODIFIED="1536504127886" TEXT="规避NIO bug(rebuild selector, 避免NIO的select死循环)"/></node><node CREATED="1536504127886" ID="685tvpkeo68pqs7uh809g3b8k0" MODIFIED="1536504127886" TEXT="内存保护"><node CREATED="1536504127886" ID="5d874dnp2l92h64kgatlernbvu" MODIFIED="1536504127886" TEXT="缓冲区的内存泄漏保护(内存池的内存由 TailHandler 代为回收)"/><node CREATED="1536504127886" ID="2p822f71cogvc9hsadrhg3sna0" MODIFIED="1536504127886" TEXT="缓冲区溢出保护(遇到畸形码流攻击，协议消息编码异常，消息丢包等等，解析到超长报文长度)(由ByteBuf的max capacity来进行内存分配最大限制)"/></node><node CREATED="1536504127886" ID="060ceuol5ms8b2ro2351l331lf" MODIFIED="1536504127886" TEXT="流量整形(限流)"/><node CREATED="1536504127886" ID="4ljgmfq3uj1718sh5ecf0pia98" MODIFIED="1536504127886" TEXT="优雅停机(将积压的消息发送出去，但是shutdownHook有30s时间限制)"/></node><node CREATED="1536504127886" ID="1g7bpgblgblc6tlpfp1ck09tv4" MODIFIED="1536504127886" TEXT="优化建议(netty的缺点)"><node CREATED="1536504127886" ID="7pg12pgh4fml7uk49ub3972vgd" MODIFIED="1536504127886" TEXT="发送队列容量上限(netty的ChannelOutBoundBuffer未设置上限，容易内存爆炸性增长)"/><node CREATED="1536504127886" ID="6678bfosc04iht9mfstebq4a6c" MODIFIED="1536504127886" TEXT="IO异常时回推发送失败的消息(netty关闭链路，删除未发送消息，最后通知handler)"/></node></node><node CREATED="1536504127886" ID="4i5fa6a531seseqj2hlqht6ca0" MODIFIED="1536504127886" POSITION="left" TEXT="java多线程编程(可略过)"/></node></map>