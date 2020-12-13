<template>
  <div v-if="display">
  <button v-on:click="testNotify">add notify</button>
  <button v-on:click="testNotify2">add notify2</button>
  </div>
</template>
<script>
module.exports = {
  data() {
    return {
      stomp: undefined,
      display: false
    }
  },
  mounted: function(){
    this.connect();
  },
  methods: {
    notify(frame) {
      let data = JSON.parse(frame.body);
      if(data.status == 'success'){
        this.$notify({
          title: '收到一條訊息',
          dangerouslyUseHTMLString: true,
          message: `
            <h4>${data.title}</h4><br>
            <p>${data.content}</p><br>
            <p>${data.dateFormatted}</p>`,
          type: 'success'
        });
      }else if(data.status == 'warning'){
        this.$notify({
          title: '收到一條警告訊息',
          dangerouslyUseHTMLString: true,
          message: `
            <h4>${data.title}</h4><br>
            <p>${data.content}</p><br>
            <p>${data.dateFormatted}</p>`,
          type: 'warning'
        });
      }else if(data.status == 'error'){
        this.$notify.error({
          title: '收到一條錯誤訊息',
          dangerouslyUseHTMLString: true,
          message: `
            <h4>${data.title}</h4><br>
            <p>${data.content}</p><br>
            <p>${data.dateFormatted}</p>`,
          duration: 0
        });
      }else{
        this.$notify.info({
          title: '收到一條訊息',
          dangerouslyUseHTMLString: true,
          message: `
            <h4>${data.title}</h4><br>
            <p>${data.content}</p><br>
            <p>${data.dateFormatted}</p>`,
        });
      }

    },
    connect() {
      var socket = new SockJS('/ws');
      this.stomp = new Stomp.over(socket);

      this.stomp.connect("guest", "guest", this.connectCallback, this.errorCallback);
      // this.$notify.info({
      //   title: 'connect',
      //   message: '進行連線',
      // });
    },
    connectCallback(){
      this.stomp.subscribe('/topic/notify', this.notify);
      this.stomp.subscribe('/user/topic/notify', this.notify);
    },
    errorCallback(error){
      alert(error.headers.message);
    },
    testNotify(){
      axios.get(context+"/testnotify").then(response => {
        console.log(response);
      });
    },
    testNotify2(){
      axios.get(context+"/testnotify2").then(response => {
        console.log(response);
      });
    }
  }

};
</script>