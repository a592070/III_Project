<template>
  <el-carousel indicator-position="outside" type="card">
    <el-carousel-item v-for="item in images" :key="item">
      <el-image :src="item" :fit="fit"></el-image>
    </el-carousel-item>
  </el-carousel>
</template>

<script>
module.exports = {
  data() {
    return {
      images: [
        context+'/assets/attraction/1/179ac12b-892f-355d-8f6a-17b605ec7894.jpg',
        context+'/assets/attraction/1/08299ea3-9700-317d-b8c5-dd9de05ff5ca.jpg',
        context+'/assets/attraction/1/ceff9e32-2c81-3176-9415-7ade0c9a0719.jpg',
      ],
      fit: 'contain'
    }
  }
}
</script>