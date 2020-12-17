<template>
  <div
      v-infinite-scroll="loadMoreItems"
      :infinite-scroll-disabled="autoLoadDisabled"
      :infinite-scroll-distance="10"
  >
    <div
        v-for="i in count"
        :key="i"
    >
      {{ i }}
    </div>
  </div>
</template>
<script>
module.exports = {
  data() {
    return{
      count: 10,
      loading: false
    }
  },
  computed: {
    noMore () {
      return this.count >= 100
    },
    autoLoadDisabled () {
      return this.loading || this.noMore
    }
  },
  methods: {
    loadMoreItems () {
      this.loading = true
      setTimeout(() => {
        this.count += 2
        this.loading = false
      }, 100)
    }
  }

}
</script>