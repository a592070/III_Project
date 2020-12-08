<template>

  <div class="container">
    <div class="row justify-content-start mb-5 pb-3">
      <div class="col-md-7 heading-section">
        <span class="subheading">特別推薦</span>
        <h2 class="mb-4"><strong>熱 門</strong> 景 點</h2>
      </div>
    </div>

<!--      <el-row :gutter="20" type="flex">-->
<!--        <el-col :span="8">-->
<!--          <el-card :body-style="{ padding: '0px' }">-->
<!--            <van-swipe :autoplay="3000">-->
<!--              <van-swipe-item v-for="(image, index) in images" :key="index">-->
<!--                <van-image fit="scale-down" lazy-load :src="image" />-->
<!--              </van-swipe-item>-->
<!--            </van-swipe>-->
<!--            <div style="padding: 14px;">-->
<!--              <span>好吃的汉堡</span>-->
<!--              <div class="bottom clearfix">-->
<!--                <time class="time">{{ new Date() }}</time>-->
<!--                <el-button type="text" class="button">操作按钮</el-button>-->
<!--              </div>-->
<!--            </div>-->
<!--          </el-card>-->
<!--        </el-col>-->
<!--        <el-col :span="8">-->
<!--          <el-card :body-style="{ padding: '0px' }">-->
<!--            <van-swipe :autoplay="3000">-->
<!--              <van-swipe-item v-for="(image, index) in images" :key="index">-->
<!--                <van-image fit="scale-down" lazy-load :src="image" />-->
<!--              </van-swipe-item>-->
<!--            </van-swipe>-->
<!--            <div style="padding: 14px;">-->
<!--              <span>好吃的汉堡</span>-->
<!--              <div class="bottom clearfix">-->
<!--                <time class="time">{{ new Date() }}</time>-->
<!--                <el-button type="text" class="button">操作按钮</el-button>-->
<!--              </div>-->
<!--            </div>-->
<!--          </el-card>-->
<!--        </el-col>-->
<!--        <el-col :span="8">-->
<!--          <el-card :body-style="{ padding: '0px' }">-->
<!--            <van-swipe :autoplay="3000">-->
<!--              <van-swipe-item v-for="(image, index) in images" :key="index">-->
<!--                <van-image fit="scale-down" lazy-load :src="image" />-->
<!--              </van-swipe-item>-->
<!--            </van-swipe>-->
<!--            <div style="padding: 14px;">-->
<!--              <span>好吃的汉堡</span>-->
<!--              <div class="bottom clearfix">-->
<!--                <time class="time">{{ new Date() }}</time>-->
<!--                <el-button type="text" class="button">操作按钮</el-button>-->
<!--              </div>-->
<!--            </div>-->
<!--          </el-card>-->
<!--        </el-col>-->
<!--      </el-row>-->


<!--    <van-row>-->
<!--      <van-col span="8">-->
<!--        <van-card-->
<!--            num="2"-->
<!--            price="2.00"-->
<!--            desc="描述信息"-->
<!--            title="商品标题"-->
<!--        >-->
<!--          <template #thumb>-->
<!--            <el-carousel :interval="4000" type="card" height="200px">-->
<!--              <el-carousel-item v-for="item in images" :key="item">-->
<!--                <el-image class="medium" :src="item"></el-image>-->
<!--              </el-carousel-item>-->
<!--            </el-carousel>-->
<!--          </template>-->
<!--          <template #footer>-->
<!--            <van-button size="mini">按钮</van-button>-->
<!--            <van-button size="mini">按钮</van-button>-->
<!--          </template>-->
<!--        </van-card>-->
<!--      </van-col>-->
<!--      <van-col span="8">span: 8</van-col>-->
<!--      <van-col span="8">span: 8</van-col>-->
<!--    </van-row>-->

    <div style=" height: 100vh; overflow:auto">
        <el-scrollbar style="height: 100%;">
          <ul class="infinite-list" v-infinite-scroll="load" style="padding-right: 10% ;">
            <li v-for="i in count" class="infinite-list-item">
              <div class="row">
                <div class="col-md-6 col-lg-3" v-for="index in 4">
                  <div class="destination">

                    <div class="img img-2 d-flex justify-content-center align-items-center">
                    <el-image
                        :src="images[0]"
                        :preview-src-list="images">
                    </el-image>
                    </div>


<!--                    <a class="img img-2 d-flex justify-content-center align-items-center"-->
<!--                       v-bind:style="{backgroundImage: 'url('+images[0]+')'}">-->
<!--                      <div class="icon d-flex justify-content-center align-items-center">-->
<!--                        <el-popover-->
<!--                            placement="right"-->
<!--                            width="400"-->
<!--                            trigger="click">-->
<!--                          <span>images</span>-->
<!--                          <el-button class="icon-search2" slot="reference"></el-button>-->
<!--                        </el-popover>-->
<!--&lt;!&ndash;                        <span class="icon-search2"></span>&ndash;&gt;-->
<!--                      </div>-->
<!--                    </a>-->


                    <div class="text p-3">
                      <h3><a href="#">Luxury Restaurant</a></h3>
                      <p class="rate">
                        <i class="icon-star"></i>
                        <i class="icon-star"></i>
                        <i class="icon-star"></i>
                        <i class="icon-star"></i>
                        <i class="icon-star-o"></i>
                        <span>8 Rating</span>
                      </p>
                      <p>Far far away, behind the word mountains, far from the countries</p>
                      <hr>
                      <p class="bottom-area d-flex">
                        <span><i class="icon-map-o"></i> San Franciso, CA</span>
                        <span class="ml-auto"><a href="#">Discover</a></span>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </el-scrollbar>
    </div>

<!--    <div style="height: 100vh">-->
<!--      <el-scrollbar style="height: 100%">-->
<!--        <div style="height: 500px; width: 100%; background: red"></div>-->
<!--        <div style="height: 500px; width: 100%; background: yellow"></div>-->
<!--        <div style="height: 500px; width: 100%; background: blue"></div>-->
<!--      </el-scrollbar>-->
<!--    </div>-->

    <div>
    <attraction-detail></attraction-detail>
    </div>
  </div>
</template>

<script>
module.exports = {
  components: {
    "attraction-detail": httpVueLoader(context + '/assets/a592070/font/js/components/attraction/attractionDetail.vue'),
  },
  data() {
    return {
      images: [
          context+'/assets/attraction/1/179ac12b-892f-355d-8f6a-17b605ec7894.jpg',
          context+'/assets/attraction/1/08299ea3-9700-317d-b8c5-dd9de05ff5ca.jpg',
          context+'/assets/attraction/1/ceff9e32-2c81-3176-9415-7ade0c9a0719.jpg',
      ],
      count: 0,
      detailImage: false,
    }
  },
  methods: {
    getFirstImage(){
    },
    load () {
      this.count += 1
    }
  }

};

</script>
<style>
.box {
  width: 200px;
  height: 100px;
  background: aliceblue;
}

.el-scrollbar {
  height: 100%;
}
.el-scrollbar__wrap {
  overflow: scroll;
  width: 110%;
  height: 120%;
}
</style>
