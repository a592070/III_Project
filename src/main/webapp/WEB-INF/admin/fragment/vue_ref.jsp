<script type="text/javascript">
    const context = "${pageContext.servletContext.contextPath}";
</script>

<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@2.10/lib/index.css" />--%>
<%--<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">--%>
<%--<link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.x/css/materialdesignicons.min.css" rel="stylesheet">--%>
<%--<link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">--%>

<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue-axios@3.2.0/dist/vue-axios.es5.js"></script>
<script src="https://unpkg.com/http-vue-loader"></script>

<script src="http://cdn.bootcss.com/sockjs-client/1.1.1/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/assets/a592070/web_modules/sass.js"></script>
<script type="text/javascript">
    const sass = new Sass()
    httpVueLoader.langProcessor.scss = function (scssText) {
        return new Promise(function (resolve, reject) {
            // 不然這邊這個 sass 會報錯...
            sass.compile(scssText, function (result) {
                if (result.status === 0)
                    resolve(result.text)
                else
                    reject(result)
            });
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>
<script src="//polyfill.io/v3/polyfill.min.js?features=es2015%2CIntersectionObserver" crossorigin="anonymous"></script>

<script>
    ELEMENT.locale(ELEMENT.lang.en);
</script>