# Question 1

**Liquid Staking offers users rewards with ETH staking without setting up its own validator, Lido
and Rocket Pool are currently the leaders according to DefiLlama. Mantle also recently
launched their LSP. Briefly explain how the three services work and how they are different.**

### Liquid Staking: Lido vs. Rocket Pool vs. Mantle

All three platforms, Lido, Rocket Pool, and Mantle, offer liquid staking solutions for Ethereum, allowing users to participate in staking rewards without the technical complexity of running their own validator. However, they differ in their approaches and key features:

**Lido:**

- **Centralized:** Lido utilizes a set of professional validator nodes operated by the Lido team.
- **Minimum Deposit:** No minimum deposit required, making it accessible to all user sizes.
- **Rewards:** Lido charges a 10% fee on staking rewards, distributed between the DAO treasury and node operators.
- **Derivatives:** Users receive stETH tokens representing their staked ETH, which can be traded or used in DeFi protocols.

**Rocket Pool:**

- **Decentralized:** Rocket Pool relies on a network of individual users who run their own validator nodes.
- **Minimum Deposit:** Requires 16 ETH to create a minipool and participate in staking, making it less accessible to smaller users.
- **Rewards:** Rocket Pool charges a 5% fee on staking rewards, shared between node operators and a decentralized insurance fund.
- **Derivatives:** Users receive rETH tokens representing their staked ETH, which are also freely tradable and usable in DeFi.

**Mantle:**

- **Hybrid:** Mantle combines elements of both centralized and decentralized approaches. It has its own set of high-performance validator nodes while simultaneously allowing users to contribute their own ETH to join community-run validator pools.
- **Minimum Deposit:** No minimum deposit required for joining community pools, similar to Lido.
- **Rewards:** Mantle charges a 10% fee on staking rewards, with 70% distributed to users, 20% for node operators, and 10% for protocol development.
- **Derivatives:** Users receive mETH tokens for staking, which can be traded or used in DeFi.

**Key Differences:**

- **Centralization:** Lido is centralized, while Rocket Pool and Mantle are decentralized or hybrid. This impacts trust and censorship resistance.
- **Accessibility:** Lido and Mantle require low minimum deposits, making them easier to access for small investors.
- **Fees:** Lido and Mantle have higher fees compared to Rocket Pool.
- **Validator Infrastructure:** Lido operates its own nodes, while Rocket Pool and Mantle rely on user-run nodes or a combination of both.

# Question 2

**Liquid Staking Token (LST) can be in the form of rebasing or non-rebasing token. What are the
pros and cons for each of them?**

### **Rebasing LSTs:**

**Pros:**

- **Simple and intuitive:** Your LST balance automatically increases, reflecting accrued staking rewards. No need for additional tokens or complex calculations.
- **Compounding effect:** Frequent rebases can lead to faster compounding of rewards, potentially boosting users' returns.
- **Easier integration:** Rebasing tokens can be readily integrated into DeFi protocols due to their constant price per token.

**Cons:**

- **Tax complexity:** Frequent rebases may trigger taxable events in some jurisdictions, adding complexity to users' tax reporting.
- **Lack of DeFi flexibility:** Frequent rebases can disrupt automated DeFi strategies due to changing underlying token values.
- **Centralization concerns:** Rebasing mechanisms can sometimes concentrate control in the hands of platform developers.

### **Non-Rebasing LSTs:**

**Pros:**

- **Tax transparency:** Rewards accrue through price appreciation of the LST, simplifying tax reporting for many users.
- **DeFi compatibility:** Non-rebasing LSTs are more readily compatible with existing DeFi protocols due to their stable price.
- **Greater control:** Users have direct control over their LSTs and can choose when to claim or reinvest rewards.

**Cons:**

- **Less intuitive:** Understanding users' actual returns can be less straightforward due to separate reward tokens or price appreciation.
- **Potentially slower compounding:** Rewards may compound slightly slower compared to frequent rebasing.
- **Limited DeFi integration:** Some DeFi protocols may not yet support non-rebasing LSTs as readily as their rebasing counterparts.

**Ultimately, the best LST type for the user depends on users' individual priorities.** If simplicity and potential for faster compounding are key, a rebasing LST may be appealing. However, if the user prioritize tax clarity, DeFi compatibility, and greater control over users' rewards, a non-rebasing LST might be a better fit.

# Question 3

**Optional: any Defi protocol(s) you like or have used you want to recommend? It doesn’t have to be on ethereum or even on L1s. Write down a few points why you like or recommend it.**

### Lybra.finance

Lybra.finance is a cutting-edge DeFi protocol built on **Liquid Staking Derivatives (LSDs)**, primarily Ethereum's stETH. Its mission is to revolutionize the user experience in DeFi by offering:

**1. Interest-bearing Stablecoin, eUSD:**

- Lybra's flagship innovation is `eUSD`, a stablecoin pegged to the US dollar but with a twist: **it generates real yield**. Users deposit ETH or rebase LSTs as collateral and mint eUSD, effectively earning **approximately 8% annual interest** passively through the underlying staking rewards.
- This provides a safe haven for capital in the volatile crypto market while simultaneously earning steady returns.

**2. Decentralized and Secure:**

- Unlike some other stablecoin models, Lybra relies on decentralized LSD pools rather than centralized reserves. This fosters **greater transparency and censorship resistance**, aligning with the core principles of DeFi.
- Additionally, Lybra employs a robust set of security mechanisms, including over-collateralization, a dedicated Stability Fund, and regular smart contract audits to ensure user funds are protected.

**3. Flexible Utility with peUSD:**

- Lybra V2 introduces `peUSD`, an omnichain version of eUSD, expanding its utility beyond its native ecosystem. peUSD offers the same stablecoin value pegged to US dollars but unlocks wider DeFi application possibilities across different chains.
- This increases user flexibility and opens up new avenues for generating yield through various DeFi protocols while maintaining the stability of the underlying eUSD value.

**In conclusion, Lybra.finance addresses two key challenges in the DeFi space: volatility and earning potential.** By bringing together the stability of a US dollar-pegged stablecoin with the passive yield generation of Liquid Staking, Lybra offers a compelling proposition for both novice and experienced DeFi users. With its focus on decentralization, security, and innovation, Lybra positions itself as a pioneer in the next generation of DeFi solutions.
