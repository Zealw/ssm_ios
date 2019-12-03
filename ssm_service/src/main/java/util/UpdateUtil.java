package util;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class UpdateUtil {
    //本地上传
    public static void uploadToSelf(MultipartFile file,File file1) throws IOException {
        file.transferTo(file1);
    }
    //上传到图片服务器
    public static void uploadToService(MultipartFile file,String path) throws IOException {
        Client client = Client.create();
        WebResource resource = client.resource(path);
        resource.put(file.getBytes());
    }

}
