# Form value count limit 1024 exceeded

I've got a form with 2500 elements. (Why not!?) (It's for doing bulk updates if you must know)

In line with the suggested code [here](http://stackoverflow.com/questions/38357108/form-submit-resulting-in-invaliddataexception-form-value-count-limit-1024-exce) I implemented a `RequestFormSizeLimit` attribute like so


    using Microsoft.AspNetCore.Http.Features;
    using Microsoft.AspNetCore.Mvc.Filters;
    using System;
    
    namespace YourApp.Models
    {
        /// <summary>
        /// Filter to set size limits for request form data
        /// </summary>
        [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
        public class RequestFormSizeLimitAttribute : Attribute, IAuthorizationFilter, IOrderedFilter
        {
            private readonly FormOptions _formOptions;

            public RequestFormSizeLimitAttribute(int valueCountLimit)
            {
                _formOptions = new FormOptions()
                {
                    ValueCountLimit = valueCountLimit
                };
            }

            public int Order { get; set; }

            public void OnAuthorization(AuthorizationFilterContext context)
            {
                var features = context.HttpContext.Features;
                var formFeature = features.Get<IFormFeature>();

                if (formFeature == null || formFeature.Form == null)
                {
                    // Request form has not been read yet, so set the limits
                    features.Set<IFormFeature>(new FormFeature(context.HttpContext.Request, _formOptions));
                }
            }
        }
    }

    
Then, on the relevant POST action, I can:

    [HttpPost]
    [RequestFormSizeLimit(valueCountLimit: 4000)]
    public ActionResult BulkUpdate(UpdateDetails updateDetails)
    
    
## Source

 * [Form submit resulting in 'InvalidDataException: Form value count limit 1024 exceeded.'](http://stackoverflow.com/questions/38357108/form-submit-resulting-in-invaliddataexception-form-value-count-limit-1024-exce)
   