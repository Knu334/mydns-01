import axios from "axios";
import { MyDNSConfig } from "./types";
import { CERTBOT_ENV_LIST } from "./constants";

// Main function
async function main() {
  // Load configuration
  const config: MyDNSConfig = {
    MYDNSJP_MASTERID: process.env.MYDNSJP_MASTERID || "",
    MYDNSJP_MASTERPWD: process.env.MYDNSJP_MASTERPWD || "",
    MYDNSJP_URL: process.env.MYDNSJP_URL || "",
  };

  // Get Certbot environment variables
  const certbotEnv: { [key: string]: string } = {};
  CERTBOT_ENV_LIST.forEach((envName) => {
    const value = process.env[envName];
    if (value) {
      certbotEnv[envName] = value;
    }
  });

  // Prepare headers and auth
  const headers = {
    Authorization: `Basic ${Buffer.from(
      `${config.MYDNSJP_MASTERID}:${config.MYDNSJP_MASTERPWD}`
    ).toString("base64")}`,
  };

  // Make POST request using axios
 await axios({
    method: "POST",
    url: config.MYDNSJP_URL,
    headers: headers,
    data: new URLSearchParams(certbotEnv).toString(),
  });
}

// Run the script
main().catch((error) => {
  console.error("Error occurred:", error);
  process.exit(1);
});
