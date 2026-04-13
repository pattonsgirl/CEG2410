## Serverless Hosting with S3 Static Websites

In this assignment, you will move away from traditional servers (like Apache and Nginx) to explore **Serverless Hosting**. You will configure an AWS S3 bucket to serve a static website directly to the public internet.

[Tutorial: Configuring a static website on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html)


### To begin:
1.  **Create a New Bucket:** Create a uniquely named S3 bucket (e.g., `lastname-static-site`).
2.  **Unblock Public Access:** By default, S3 buckets are private. You must explicitly disable "Block all public access" for this specific bucket to allow web traffic.

### What to set up:
1.  **Static Website Hosting:** * In the bucket properties, enable **Static website hosting**.
    * Define your `index.html` and `error.html` documents.
2.  **Bucket Policy:** * To make the files readable by the public, you must apply a **JSON Bucket Policy**. This policy grants the `s3:GetObject` permission to everyone (`*`).
3.  **Content Upload:** * Upload your website files (HTML, CSS, Images) to the root of the bucket.
4.  **Testing:** * Locate the **Bucket Website Endpoint** URL provided by AWS. 
    * Verify your site loads in a browser without needing to login to AWS.

### Documentation Requirements:

Create a folder in your GitHub repository called `storage`. Create a file named `s3-static-site.md`:

1.  **The Endpoint:** Provide the URL to your static site.
2.  **The Policy:** Copy and paste the JSON Bucket Policy you used. Briefly explain what the `Effect`, `Principal`, and `Action` lines mean.
3.  **Comparison:** Explain one advantage and one disadvantage of hosting a site on S3 versus hosting it on your Apache EC2 instance.
4.  **Screenshot:** Show your site loading via the S3 endpoint.

---

## Submission
Submit links to both `s3-static-site.md`

## Rubric
Your `s3-static-site.md` should include all of the following required elements:

- [ ] The S3 static website endpoint URL is provided
- [ ] The JSON bucket policy is shown with `Effect`, `Principal`, and `Action` explained
- [ ] One advantage and one disadvantage of S3 hosting versus Apache EC2 hosting is described
- [ ] A screenshot is provided showing the site loading via the S3 endpoint

---

### Tips:
* **The Policy "Gotcha":** Many students will enable "Static Website Hosting" but forget the **Bucket Policy**. The site will return a `403 Forbidden` until that JSON policy is applied.