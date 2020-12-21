<template>
  <v-app>
    <v-main>

  <v-container style="height: 80%">
    <v-btn
        color="pink accent-1"
        depressed
        x-large
        @click="importData"
    >
      DEMO
    </v-btn>
    <v-row>
      <v-spacer></v-spacer>
      <v-col md="10" :align="'center'">
  <v-card
      color="blue-grey darken-1"
      dark
      :loading="isUpdating"
  >
    <template v-slot:progress>
      <v-progress-linear
          absolute
          color="green lighten-3"
          height="4"
          indeterminate
      ></v-progress-linear>
    </template>
    <v-card
        class="mx-auto"
        color="#26c6da"
        dark
        height="200"
    >
      <v-card-title>
        <p class="title font-weight-light">{{ title }}</p>
      </v-card-title>

      <v-card-text class="headline font-weight-bold">
        {{ message }}
      </v-card-text>
    </v-card>
    <v-form>
      <v-container>
        <v-row>
          <v-col
              cols="12"
              md="8"
          >
            <v-text-field
                v-model="title"
                :disabled="isUpdating"
                placeholder="請輸入標題..."
                filled
                color="blue-grey lighten-2"
                label="標題"
            ></v-text-field>
          </v-col>
          <v-col
              cols="12"
              md="4"
          >
            <v-select
                v-model="selectStatus"
                :items="status"
                chips
                label="訊息狀態"
                color="blue-grey lighten-2"
                solo
            ></v-select>
          </v-col>
          <v-col
              cols="12"
          >
            <v-select
                v-model="selectUsers"
                :items="users"
                label="選擇"
                chips
                hint="選擇使用者"
                persistent-hint
            ></v-select>
          </v-col>

          <v-col cols="12">
            <v-textarea
                v-model="message"
                :disabled="isUpdating"
                placeholder="請輸入內容..."
                filled
                auto-grow
                clearable
                clear-icon="mdi-close-circle"
                color="blue-grey lighten-2"
                label="內容"
            ></v-textarea>

          </v-col>
        </v-row>
      </v-container>
    </v-form>
    <v-divider></v-divider>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
          color="blue-grey darken-3"
          depressed
          x-large
          @click="handlePublish"
      >
        <v-icon left>
          mdi-publish
        </v-icon>
        發布訊息
      </v-btn>

      <v-spacer></v-spacer>
      <v-btn
          :loading="isUpdating"
          color="blue-grey darken-3"
          depressed
          @click="handleGetUsers"
      >
        <v-icon left>
          mdi-update
        </v-icon>
        更新在線使用者
      </v-btn>
    </v-card-actions>
  </v-card>
      </v-col>
      <v-spacer></v-spacer>
    </v-row>
    <v-snackbar
        :timeout="2000"
        v-model="snackbar"
        color="blue-grey"
        absolute
        right
        rounded="pill"
        top
    >
      訊 息 已 發 送
    </v-snackbar>
  </v-container>
    </v-main>
  </v-app>
</template>

<script>
module.exports = {
  data () {
    return {
      snackbar: false,
      selectStatus: '',
      status: [
        { text: '成功訊息', value: 1},
        { text: '警告訊息', value: 2},
        { text: '錯誤訊息', value: 3},
        { text: '一般訊息', value: 0}],
      connectUsers: ['Sandra Adams', 'Britta Holt'],
      isUpdating: false,
      title: '',
      message: '',

      selectUsers: [],
      users: []

      ,
      selectItem1: [
        { header: 'ALL' },
        { text: '選擇全部', value: 'all'},
      ],
      selectItemUser: [
        { header: '全部' },
        { text: '選擇全部', value: 'all'},
        { divider: true },
        { header: '登錄用戶' },
      ],
      selectItemGuest: [
        { divider: true },
        { header: '訪客' },
      ]

    }
  },

  watch: {
    // isUpdating (val) {
    //   if (val) {
    //     setTimeout(() => (this.isUpdating = false), 3000)
    //   }
    // },
  },
  computed: {

  },

  created: function () {
    this.handleGetUsers();
  },
  methods: {
    handleGetUsers(){
      this.isUpdating = true;
      let url = context + "/broadcast/users";
      axios.get(url)
        .then((response) => {
          console.log(response.data);
          let data = response.data;
          let itemBody1 = this.selectItemUser;
          let itemBody2 = this.selectItemGuest;
          for (let i = 0; i < data.length; i++) {
            if(data[i].group == 'user') {
              itemBody1.push({
                text: data[i].name,
                value: data[i].name
              })
            } else if(data[i].group == 'guest'){
              itemBody2.push({
                text: 'guest'+i,
                value: data[i].name
              })
            }
          }
          this.users = itemBody1.concat(itemBody2);

          this.isUpdating = false;
        })
    },
    handlePublish(){
      let param = {title: this.title, message: this.message, status: this.selectStatus};
      console.log(param);

      let url = "/broadcast/publish";
      if(this.selectUsers != 'all') url += '/'+this.selectUsers;
      axios.post(url, param)
          .then(response => {
            if(response.data){
              this.snackbar = true
            }
          })
    },


    remove (item) {
      const index = this.connectUsers.indexOf(item.name)
      if (index >= 0) this.connectUsers.splice(index, 1)
    },
    importData(){
      this.title = '測試資料';
      this.message = '這是一筆測試資料';
      this.selectStatus = 2;
    },
  },
};
</script>