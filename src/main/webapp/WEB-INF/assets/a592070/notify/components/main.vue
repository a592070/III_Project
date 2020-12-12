<template>
</template>
<script>
module.exports = {
  data() {
    return {
      stomp: undefined
    }
  },
  computed: {

  },
  methods: {
    notify(frame) {
      let data = JSON.parse(frame.body);
      if(data.status == 'success'){
        this.$notify({
          title: data.title,
          message: data.content,
          type: 'success'
        });
      }else if(data.status == 'warning'){
        this.$notify({
          title: data.title,
          message: data.content,
          type: 'warning'
        });
      }else if(data.status == 'error'){
        this.$notify.error({
          title: data.title,
          message: data.content,
          duration: 0
        });
      }else{
        this.$notify.info({
          title: data.title,
          message: data.content,
        });
      }

    },
    connect() {
      var socket = new SockJS('/ws');
      this.stomp = new Stomp.over(socket);

      this.stomp.connect("guest", "guest", this.connectCallback, this.errorCallback);
    },
    connectCallback(){
      this.stomp.subscribe('/topic/notify', this.notify);
    },
    errorCallback(){
      alert(error.headers.message);
    }
  }

};
</script>