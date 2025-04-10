# Azure Automation Scripts

This repository contains modular PowerShell scripts and JSON configuration files for automating the creation of Azure resources such as:

- Azure App Services
- Azure Function Apps
- Azure Front Door configuration (CDN routing + HTTPS)
- DNS record creation
- SSL certificate binding (managed certs via Front Door)

All scripts are designed to be reusable and easily triggered via command line or CI/CD tools like GitHub Actions.

---

## 📂 Project Structure

```
azure-automation/
├── scripts/
│   ├── appservice/
│   │   ├── create-appservice.ps1
│   │   └── create-appservice.md
│   ├── functionapp/
│   │   ├── create-functionapp.ps1
│   │   └── create-functionapp.md
│   ├── frontdoor/
│   │   ├── configure-frontdoor.ps1
│   │   └── configure-frontdoor.md
│   ├── dns/
│   │   ├── create-dns-record.ps1
│   │   └── create-dns-record.md
│   └── ssl/
│       ├── bind-ssl-cert.ps1
│       └── bind-ssl-cert.md
├── config/
│   ├── client1-app.json
│   ├── client1-function.json
│   └── client1-frontdoor.json
└── README.md
```

---

## 🔧 Prerequisites

- PowerShell 7+
- Azure CLI installed and logged in (`az login`)
- Proper Azure permissions (Contributor or higher)

---

## ✅ Usage

### Run App Service Script

```powershell
pwsh ./scripts/appservice/create-appservice.ps1 -ConfigFile ./config/client1-app.json
```

### Run Function App Script

```powershell
pwsh ./scripts/functionapp/create-functionapp.ps1 -ConfigFile ./config/client1-function.json
```

### Configure Azure Front Door

```powershell
pwsh ./scripts/frontdoor/configure-frontdoor.ps1 -ConfigFile ./config/client1-frontdoor.json
```

### Create DNS Record (Azure DNS)

```powershell
pwsh ./scripts/dns/create-dns-record.ps1 `
  -ResourceGroup "dns-rg" `
  -DnsZoneName "yourdomain.com" `
  -Subdomain "client1.yourdomain.com" `
  -TargetHostname "client1-webapp.azurewebsites.net"
```

### Bind SSL Certificate on Front Door

```powershell
pwsh ./scripts/ssl/bind-ssl-cert.ps1 `
  -ResourceGroup "client1-rg" `
  -ProfileName "client1-frontdoor" `
  -CustomDomainName "client1.yourdomain.com"
```

> You can duplicate and modify config files in the `config/` folder to create resources for other clients or environments.

## 🚧 Customization

- Scripts are parameterized via JSON files or CLI flags for flexibility
- Add additional properties to JSON configs as needed (e.g., environment tags, subdomain name, etc.)

---

## 🔄 Future Improvements

- GitHub Actions integration
- Multi-region support
- Parameter validation & error handling enhancements

---

## 📖 View Documentation Locally

To preview the Docsify documentation site on your local machine:

### Step 1: Install Docsify CLI (optional)

If not already installed globally:

```bash
npm install docsify-cli -g
```

### Step 2: Serve the site

Run this in the project root:

```bash
npx docsify-cli serve docs
```

### Step 3: Open in browser

Visit: [http://localhost:3000](http://localhost:3000)

This will load the documentation using `index.html` and `_sidebar.md` from the `/docs` folder.

---

## 🌐 GitHub Pages

To turn this into a browsable GitHub Pages documentation site:

1. Go to your repository settings → **Pages**.
2. Select `main` branch and set root to `/` or `/docs` depending on where you want your site files.
3. Use a simple static site generator like [Docsify](https://docsify.js.org), [Jekyll](https://jekyllrb.com), or [MkDocs](https://www.mkdocs.org) to structure and style the site.
4. Create an `index.html` and `_sidebar.md` at your documentation root to enable navigation.

**Example `_sidebar.md` for Docsify:**

````markdown
- Getting Started
  - [README](README.md)
- Scripts
  - [App Service](scripts/appservice/create-appservice.md)
  - [Function App](scripts/functionapp/create-functionapp.md)
  - [Front Door](scripts/frontdoor/configure-frontdoor.md)
  - [DNS Record](scripts/dns/create-dns-record.md)
  - [SSL Binding](scripts/ssl/bind-ssl-cert.md)

```markdown
- Scripts
  - [App Service](scripts/appservice/create-appservice.md)
  - [Function App](scripts/functionapp/create-functionapp.md)
  - [Front Door](scripts/frontdoor/configure-frontdoor.md)
  - [DNS Record](scripts/dns/create-dns-record.md)
  - [SSL Binding](scripts/ssl/bind-ssl-cert.md)
```
````

---

## 🎓 License

This project is provided as-is under the MIT License.

---

## 📝 Scripts

Scripts are located in the `/scripts` folder, organized by category. Each script has a corresponding markdown file with documentation. You can also view them directly from the Docsify-powered site or link to them here:

- [`App Service`](scripts/create-appservice.md)
- [`Function App`](scripts/create-functionapp.md)
- [`Front Door`](scripts/configure-frontdoor.md)
- [`DNS Record`](scripts/create-dns-record.md)
- [`SSL Binding`](scripts/bind-ssl-cert.md)

Refer to the script folders for full documentation and usage notes.

## 📃 Sample Config Files

### config/client1-app.json

```json
{
  "resourceGroup": "client1-rg",
  "location": "eastus",
  "appServicePlan": "client1-plan",
  "webAppName": "client1-webapp",
  "sku": "B1"
}
```

### config/client1-function.json

```json
{
  "resourceGroup": "client1-rg",
  "location": "eastus",
  "functionAppName": "client1-funcapp",
  "storageAccount": "client1storage01",
  "runtime": "node",
  "version": "4"
}
```

### config/client1-frontdoor.json

```json
{
  "resourceGroup": "client1-rg",
  "profileName": "client1-frontdoor",
  "originGroupName": "client1-origin-group",
  "originName": "client1-origin",
  "hostname": "client1-webapp.azurewebsites.net",
  "endpointName": "client1-endpoint",
  "routeName": "client1-route",
  "customDomain": "client1.yourdomain.com"
}
```
