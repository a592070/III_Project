<template>
  <v-app>
    <v-main>
  <v-container>
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
    <v-img
        height="200"
        src="https://cdn.vuetifyjs.com/images/cards/dark-beach.jpg"
    >
      <v-row>
        <v-col
            class="text-right"
            cols="12"
        >
          <v-menu
              bottom
              left
              transition="slide-y-transition"
          >
            <v-list>
              <v-list-item @click="isUpdating = true">
                <v-list-item-action>
                  <v-icon>mdi-cog</v-icon>
                </v-list-item-action>
                <v-list-item-content>
                  <v-list-item-title>Update</v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-menu>
        </v-col>
        <v-row
            class="pa-4"
            align="center"
            justify="center"
        >
          <v-col class="text-center">
            <h3 class="headline">
              {{ title }}
            </h3>
            <span class="grey--text text--lighten-1">{{ message }}</span>
          </v-col>
        </v-row>
      </v-row>
    </v-img>
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
                label="Title"
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
                label="Status"
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
                label="Select"
                chips
                hint="What are the target regions"
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
                label="Message"
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
        Publish
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
        Update User
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
        { text: 'Success', value: 1},
        { text: 'Warning', value: 2},
        { text: 'Error', value: 3},
        { text: 'Other', value: 0}],
      connectUsers: ['Sandra Adams', 'Britta Holt'],
      isUpdating: false,
      title: '',
      message: '',

      selectUsers: [],
      users: []

      ,
      selectItem1: [
        { header: 'ALL' },
        { text: 'ALL USERS', value: 'all'},
      ],
      selectItemUser: [
        { header: 'ALL' },
        { text: 'ALL USERS', value: 'all'},
        { divider: true },
        { header: 'User' },
      ],
      selectItemGuest: [
        { divider: true },
        { header: 'Guest' },
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
                text: 'user'+i,
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
  },
};
</script>