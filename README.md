# ransj
ransj是中文分析包[ansj](https://github.com/NLPchina/ansj_seg)的R包.
ansj是中科院分词系统ICTCLAS的java实现. 提供中文分词、词性标注功能，支持人名识别、机构名识别、数量词识别、用户自定义词典。
支持ansj中的nlp分词、基础分词、精准分词、面向索引分词、用户自定义词典优先分词方法。
nlp分词方法使用了CRF模型，词性标注使用了HMM模型。

## 安装
***
`
devtools::install_github("Juntai/ransj")
library(ransj)
`
## 使用示例
***
第一次调用segment函数时会有些慢，因为要加载用户字典和CRF模型。但第二次就很快了。
### 默认设置，两种输出格式
`
segment("让战士们度过一个快乐祥和的春节。")

segment("让战士们度过一个快乐祥和的春节。", returnType="vector")
`
### 词性标注，两种输出格式
`
segment("让战士们度过一个快乐祥和的春节。", nature=TRUE) # 词性标注。POS tagging

segment("让战士们度过一个快乐祥和的春节。", nature=TRUE, returnType="vector") # 词性标注。POS tagging
`
### 停用词过滤
`
insertStopwords(c("一个","的"))

showStopwords()

segment("让战士们度过一个快乐祥和的春节。", stopwords=TRUE)

clearStopwords()

showStopwords
`
### 词性过滤
`
segment("让战士们度过一个快乐祥和的春节。", naturesInclude = c("n", "ns"))

segment("让战士们度过一个快乐祥和的春节。", naturesRemove = c("n", "ns"))
`