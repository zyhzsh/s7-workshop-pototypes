import { defineConfig, devices } from '@playwright/test';

const config = {
  // only change the following properties
  webServer: {
    command: 'npm dev',
    port: 1337, // should match the port you gave in our vite.config file
    reuseExisitingServer: true,
  },
  fullyParallel: false,
  projects: [
    {
      name: 'Google Chrome',
      use: {
        channel: 'chrome',
      },
    },
    {
      name: 'Mobile Chrome',
      use: {
        ...devices['Pixel 5'],
      },
    },
  ],
};
