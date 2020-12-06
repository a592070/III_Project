<template>
  <div>
  </div>
</template>

<script>
module.exports = {
  data() {
    return {
    }
  },
  created: function () {
    console.log("init")
  },
  computed: Vuex.mapState(['currentEditTravelSetDetail']),
  methods: {
  }
}
</script>