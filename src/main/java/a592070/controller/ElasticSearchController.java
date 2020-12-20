package a592070.controller;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

//@Controller
public class ElasticSearchController {
    @Autowired
    RestHighLevelClient restHighLevelClient;

}
