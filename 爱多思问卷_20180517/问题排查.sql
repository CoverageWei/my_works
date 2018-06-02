问题排查：

coursedesign-service
 <plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <version>1.4.3.RELEASE</version>
    <configuration>
        <mainClass>com.netease.edu.coursedesign.CourseDesignApplication</mainClass>
    </configuration>
    <executions>
        <execution>
            <goals>
                <goal>repackage</goal>
            </goals>
        </execution>
    </executions>
</plugin>


spring-boot：
    ndp/source  app.jar  解压jar，   meta-INF  mainclass ,  boot-INF/lib 所有包；

git 工程中的 build.xml 打包；
打包好的 东西在 conpress 目录下； ndp 将 conpress 下文件上传到 nos；

varnish + nginx

configtest
.../nginx -t 查看nginx报错 
less nginx.conf

proxy_set_header


-verbose:class 程序启动时候打印日志 加载的类；


platform5  ~/tools/dump_files


jmx 端口 debug












































