<template>
  <el-card shadow="never" class="border-0">
    <!-- 新增|刷新 -->
    <ListHeader layout="create,delete,refresh" @create="handleCreate" @refresh="getData" @delete="handleMultiDelete" />

    <el-table ref="multipleTableRef" @selection-change="handleSelectionChange" :data="tableData" stripe
      style="width: 100%" v-loading="loading">
      <el-table-column type="selection" width="55" />
      <el-table-column prop="name" label="规格名称" />
      <el-table-column prop="default" label="规格值" width="380" />
      <el-table-column prop="order" label="排序" />
      <el-table-column label="状态" width="120">
        <template #default="{ row }">
          <el-switch :modelValue="row.status" :active-value="1" :inactive-value="0" :loading="row.statusLoading"
            :disabled="row.super == 1" @change="handleStatusChange($event, row)">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="250" align="center">
        <template #default="scope">
          <el-button type="primary" size="small" text @click="handleEdit(scope.row)">修改</el-button>

          <el-popconfirm title="是否要删除该规格？" confirmButtonText="确认" cancelButtonText="取消"
            @confirm="handleDelete(scope.row.id)">
            <template #reference>
              <el-button text type="primary" size="small">删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <div class="flex items-center justify-center mt-5">
      <el-pagination background layout="prev, pager ,next" :total="total" :current-page="currentPage" :page-size="limit"
        @current-change="getData" />
    </div>

    <FormDrawer destroyOnClose ref="formDrawerRef" :title="drawerTitle" @submit="handleSubmit">
      <el-form :model="form" ref="formRef" :rules="rules" label-width="80px" :inline="false">
        <el-form-item label="规格名称" prop="name">
          <el-input v-model="form.name" placeholder="规格名称"></el-input>
        </el-form-item>
        <el-form-item label="排序" prop="order">
          <el-input-number v-model="form.order" :min="0" :max="1000">
          </el-input-number>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-switch v-model="form.status" :active-value="1" :inactive-value="0">
          </el-switch>
        </el-form-item>
        <el-form-item label="规格值" prop="default">
          <TagInput v-model="form.default" />
        </el-form-item>
      </el-form>
    </FormDrawer>

  </el-card>
</template>
<script setup>
import { ref } from "vue"
import ListHeader from "~/components/ListHeader.vue";
import FormDrawer from "~/components/FormDrawer.vue";
import TagInput from "~/components/TagInput.vue";
import {
  getSkusList,
  createSkus,
  updateSkus,
  deleteSkus,
  updateSkusStatus,
} from "~/api/skus"
import {
  toast
} from "~/composables/util"

import { useInitTable, useInitForm } from '~/composables/useCommon.js'

const {
  tableData,
  loading,
  currentPage,
  total,
  limit,
  getData,
  handleDelete,
  handleStatusChange,
  handleSelectionChange,
  multipleTableRef,
  handleMultiDelete
} = useInitTable({
  getList: getSkusList,
  delete: deleteSkus,
  updateStatus: updateSkusStatus
})

const {
  formDrawerRef,
  formRef,
  form,
  rules,
  drawerTitle,
  handleSubmit,
  handleCreate,
  handleEdit
} = useInitForm({
  form: {
    name: "",
    status: 1,
    default: "",
    order: 50
  },
  rules: {
    name: [{
      required: true,
      message: '规格名称不能为空',
      trigger: 'blur'
    }],
    default: [{
      required: true,
      message: '规格值不能为空',
      trigger: 'blur'
    }],
  },
  getData,
  update: updateSkus,
  create: createSkus
})


</script>