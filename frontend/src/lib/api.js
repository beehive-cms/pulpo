import Rails from 'rails-ujs'

function serializeQuery(params, prefix) {
  const query = Object.keys(params).map((key) => {
    const value  = params[key];

    if (params.constructor === Array)
      key = `${prefix}[]`;
    else if (params.constructor === Object)
      key = (prefix ? `${prefix}[${key}]` : key);

    if (typeof value === 'object')
      return serializeQuery(value, key);
    else
      return `${key}=${encodeURIComponent(value)}`;
  });

  return [].concat.apply([], query).join('&');
}

export default {
  async updateOrder (model, ids) {
    Rails.ajax({
      type: 'PUT',
      url: `/admin/reorder/${model}.json`,
      data: serializeQuery({ ids: ids }, '')
    })
  },
}
